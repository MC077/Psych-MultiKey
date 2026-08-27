import tjson.TJSON;
import flixel.util.FlxSort;
import backend.Difficulty;
import backend.MusicBeatState;
import backend.Language;
import backend.Song;
import objects.Note;
import objects.NoteSplash;

var keyBinds:Array<Array<String>> = [];
var keyCount:Int = 0;

var scriptPath:String;
var multiKey:Bool = true;

function onCreate() {

    var name:String = getChartString();
    var json:Dynamic = TJSON.parse(Paths.getTextFromFile(name));

    if (json.song != null && json.song.keyCount != null) keyCount = json.song.keyCount;
    else if (json.keyCount != null) keyCount = json.keyCount;
    else {
        multiKey = false;
        return Function_Stop;
    }
    
    if (keyCount == 4) {
        multiKey = false;
        return Function_Stop;
    }

    scriptPath = 'scripts/Keys/' + keyCount + 'K' + (PlayState.isPixelStage ? '-pixel' : '') + '.hx';

    if (!Paths.fileExists(scriptPath)) {
        game.addTextToDebug("No valid keycount found!", 0xFFFF0000);
        multiKey = false;
        return Function_Stop;
    }

    loadKeyBinds();
    game.startHScriptsNamed(scriptPath);
    MusicBeatState.getVariables().set('keyCount', keyCount); //just for people who use it for stuff
}

function onUpdate(elapsed:Float) {
    if (multiKey) {
        var controls:Array<Array<Array<Bool>>> = [];
        var botPlay:Bool = game.cpuControlled; //call it here for people in charting mode

        for (i in 0...keyCount) {
            controls[i] = [];
            for (key in 0...keyBinds[i].length) {
                controls[i].push([keyboardJustPressed(StringTools.trim(keyBinds[i][key])), keyboardPressed(StringTools.trim(keyBinds[i][key]))]);
            }

            var shouldStatic:Bool = true;
            for (check in 0...controls[i].length) {

                var curKey:Array<Bool> = controls[i][check];

                if (curKey[0] && !botPlay) {
                    figureOutHit(i);
                    shouldStatic = false;
                } else if (curKey[1] && !botPlay) {
                    for (note in notes.members) {
                        if (note == null) continue;

                        if (note.mustPress && note.noteData == i && note.isSustainNote && note.canBeHit && !note.wasGoodHit)
                        {
                            game.goodNoteHit(note);
                        }
                    }
                    shouldStatic = false;
                }
            }

            if (shouldStatic && !botPlay) playerStrums.members[i].playAnim("static");
        }
    }
}

function onCreatePost() {
    if (multiKey) {
        game.botplayTxt.text = "MULTIKEY " + Language.getPhrase("Botplay").toUpperCase(); //this doesnt do anything different
        for (note in unspawnNotes) {
            if (note.isSustainNote) note.noteSplashData.disabled = true;
        }
    }
}

function onKeyPressPre(key:Int) if (multiKey) return Function_Stop;

function onKeyReleasePre(key:Int) if (multiKey) return Function_Stop;

function onGhostTap(key:Int) {
    if (multiKey) {
        playerStrums.members[key].playAnim('pressed');
        playerStrums.members[key].resetAnim = 0;
    }
}

function goodNoteHit(note:Note) {
    if (multiKey) {
        var scale:Float = 6942067;

        switch(keyCount) {
            case 6, 7: scale = 0.6;
            case 8: scale = 0.5;
            case 9: scale = 0.4;
            case 10, 11, 12, 13: scale = 0.35;
            case 14, 15: scale = 0.275;
            case 16, 17, 18: scale = 0.25;
            default: scale = 1;
        }

        for (splash in game.grpNoteSplashes) {
            splash.scale.set(splash.config.scale * scale, splash.config.scale * scale);

            
            var anim:String = splash.animation;
		    var conf:NoteSplashAnim = splash.config.animations.get(anim);
		    var offsets:Array<Float> = [0, 0];
		    if (conf != null) offsets = conf.offsets;


            splash.offset.set(offsets[0] * scale, offsets[1] * scale);
        }
    }
}

function opponentNoteHit(note:Note) {
    if (multiKey) {
        opponentStrums.members[note.noteData].playAnim('confirm', true);
        opponentStrums.members[note.noteData].resetAnim = Conductor.stepCrochet * 1.25 / 1000 / game.playbackRate;
        if (note.isSustainNote) {
            note.clipToStrumNote(opponentStrums.members[note.noteData]);
            note.wasGoodHit = true;
        } else invalidateNote(note);

        dad.holdTimer = 0;
    }
}

var skipArrowStartTween:Bool = false;

function onCountdownStarted() {
    if (skipCountdown) skipArrowStartTween = true;
}

//CUSTOM FUNCTIONS
///////////////////////////////////////////////////////////////////


function getChartString():String {
    if (Difficulty.getString(false) == 'normal') {
        return 'data/' + Song.loadedSongName + '/' + Song.loadedSongName + '.json';
    } else {
        return 'data/' + Song.loadedSongName + '/' + Song.loadedSongName + '-' + Difficulty.getString().toLowerCase() + '.json';
    }
}

function loadKeyBinds() {
    var text:String = Paths.getTextFromFile('Keybinds/' + keyCount + 'K.txt');
    
    if (text != null && text != '') {
        var fakeArray:Array<String> = text.split('||');
        for (i in 0...keyCount) {
            keyBinds[i] = [];
            for (key in 0...fakeArray[i].split(',').length) {
                keyBinds[i].push(fixKeybind(fakeArray[i].split(',')[key]));
            }
            
        }
    } else {
        if (text == null) {
            game.addTextToDebug("No " + keyCount + "K keybinds found! Enabling BotPlay.", 0xFFFF0000);
            game.cpuControlled = true;
            game.botplayTxt.text = "MISSING KEYBINDS";
        } else if (text == '') {
            game.addTextToDebug("Your keybinds are empty! Enabling BotPlay.", 0xFFFF0000);
            game.cpuControlled = true;
            game.botplayTxt.text = "EMPTY KEYBINDS";
        } else if (keyBinds.length < keyCount) {
            game.addTextToDebug("Your keybinds are missing binds! Enabling BotPlay.", 0xFFFF0000);
            game.cpuControlled = true;
            game.botplayTxt.text = "INSUFFICIENT KEYBINDS";
        }
        for (i in 0...keyCount) keyBinds[i] = ['null'];
    }
}

function tweenNoteIn(player:Int, strum:StrumNote) {
    var targetAlpha:Float = 1;
	if (player < 1)
	{
		if (!ClientPrefs.data.opponentStrums)
			targetAlpha = 0;
		else if (ClientPrefs.data.middleScroll)
			targetAlpha = 0.35;
	}

	if (!game.isStoryMode && !skipArrowStartTween)
	{
		strum.alpha = 0;
		FlxTween.tween(strum, {alpha: targetAlpha}, 1, {ease: FlxEase.circOut,	startDelay: ((0.5 + (0.2 * strum.noteData) / (keyCount / 2)) / Std.parseFloat(ClientPrefs.getGameplaySetting('songspeed')) )});
	}
	else
	{
		strum.alpha = targetAlpha;
	}
}


function figureOutHit(key:Int) {
    // obtain notes that the player can hit
	var plrInputNotes:Array<Note> = notes.members.filter(function(n:Note):Bool {
		var canHit:Bool = n != null && !strumsBlocked[n.noteData] && n.canBeHit && n.mustPress && !n.tooLate && !n.wasGoodHit && !n.blockHit;
		return canHit && !n.isSustainNote && n.noteData == key;
	});
	plrInputNotes.sort(sortHitNotes);

	if (plrInputNotes.length != 0) { // slightly faster than doing `> 0` lol
		var funnyNote:Note = plrInputNotes[0]; // front note

		if (plrInputNotes.length > 1) {
			var doubleNote:Note = plrInputNotes[1];
			if (doubleNote.noteData == funnyNote.noteData) {
				// if the note has a 0ms distance (is on top of the current note), kill it
				if (Math.abs(doubleNote.strumTime - funnyNote.strumTime) < 1.0)
					invalidateNote(doubleNote);
				else if (doubleNote.strumTime < funnyNote.strumTime)
				{
					// replace the note if its ahead of time (or at least ensure "doubleNote" is ahead)
					funnyNote = doubleNote;
				}
			}
		}
		game.goodNoteHit(funnyNote);
    } else {
		if (ClientPrefs.data.ghostTapping)
			onGhostTap(key);
		else
			game.noteMissPress(key);
    }
}

function sortHitNotes(a:Note, b:Note):Int
{
	if (a.lowPriority && !b.lowPriority)
		return 1;
	else if (!a.lowPriority && b.lowPriority)
		return -1;

	return FlxSort.byValues(FlxSort.ASCENDING, a.strumTime, b.strumTime);
}

function invalidateNote(note:Note):Void {
	note.kill();
	notes.remove(note, true);
	note.destroy();
}

function updateNoteDatas() {
    var lastData:Int = 0;
    for (note in unspawnNotes) {

        if (note.noteType == 'Hurt Note') note.extraData.set('canChangeRGB', false);

        if (note.extraData.get("realData") != null) note.noteData = Std.parseInt(note.extraData.get("realData"));

        switch(keyCount) { //trying to at least normalize it to be fun for less than 4 keys on charts not meant for it
            case 2:
                if (note.noteData == 1) note.noteData = 0;
                if (note.noteData == 2) note.noteData = 1;
                if (note.noteData == 3) note.noteData = 1;
            case 3:
                if (!note.isSustainNote && note.noteData == 3) lastData = FlxG.random.int(0, 2);
                if (note.noteData == 3) note.noteData = lastData;
            default:
                if (note.noteData > keyCount - 1) note.noteData = 0;
        }
    }
}

function getMultiTexture(texture:String, ?isPixelHold:Bool = false):String {
    if (Paths.fileExists('images/' + (PlayState.isPixelStage ? 'pixelUI/' : '') + 'noteSkins/NOTE_assets' + Note.getNoteSkinPostfix() + '-multi.png', 'IMAGE') && (texture == '' || texture == null)) return 'noteSkins/NOTE_assets' + (isPixelHold ? 'ENDS' : '') + Note.getNoteSkinPostfix()  + '-multi';
    else if (Paths.fileExists('images/' + (PlayState.isPixelStage ? 'pixelUI/' : '') + texture + '-multi.png', 'IMAGE')) return texture + (isPixelHold ? 'ENDS' : '') + '-multi';
    else return (PlayState.isPixelStage ? 'pixelUI/' : '') + 'noteSkins/NOTE_assets' + (isPixelHold ? 'ENDS' : '') + '-multi'; //idk how youd fuck up this bad but just in case!
}

function fixKeybind(key:String):String {
    switch(StringTools.trim(key.toUpperCase())) {
        case '.': return 'PERIOD';
        case '\\': return 'BACKSLASH';
        case '/': return 'SLASH';
        case 'CAPS': return 'CAPSLOCK'; //yknow, just in case
        case ',': return 'COMMA';
        case "'": return 'QUOTE';
        case ';': return 'SEMICOLON';
        case 'CNTRL': return 'CONTROL';
        case 'DEL': return 'DELETE';
        case 'ESC': return 'ESCAPE';
        case 'INS': return 'INSERT';
        case '[': return 'LBRACKET';
        case ']': return 'RBRACKET';
        case 'NUM LK', 'NUMLK': return 'NUMLOCK';
        case 'SCR LK', 'SCRLK': return 'SCROLL_LOCK';
        case '+': return 'PLUS';
        case '-': return 'MINUS';
        case 'PRT SCR', 'PRTSCN': return 'PRINTSCREEN';

        case '1': return 'ONE';
        case '2': return 'TWO';
        case '3': return 'THREE';
        case '4': return 'FOUR';
        case '5': return 'FIVE';
        case '6': return 'SIX';
        case '7': return 'SEVEN';
        case '8': return 'EIGHT';
        case '9': return 'NINE';
        case '0': return 'ZERO';

        default: return StringTools.trim(key.toUpperCase());
    }
}