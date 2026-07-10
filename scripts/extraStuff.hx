import tjson.TJSON;
import flixel.util.FlxSort;
import backend.Difficulty;
import backend.MusicBeatState;
import backend.Song;
import objects.Note;

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

    switch(keyCount) {
        case 1:
            scriptPath = 'scripts/Keys/1K.hx';
        case 2:
            scriptPath = 'scripts/Keys/2K.hx';
        case 3:
            scriptPath = 'scripts/Keys/3K.hx';
        case 5:
            scriptPath = 'scripts/Keys/5K.hx';
        case 6:
            scriptPath = 'scripts/Keys/6K.hx';
        case 7:
            scriptPath = 'scripts/Keys/7K.hx';
        case 8:
            scriptPath = 'scripts/Keys/8K.hx';
        default:
            if (keyCount != 4) {
                game.addTextToDebug("No valid keycount found!", 0xFFFF0000);
            }
            multiKey = false;
            return Function_Stop;
    }

    loadKeyBinds();
    game.startHScriptsNamed(scriptPath);
}

function onUpdate(elapsed:Float) {
    if (multiKey) {

        var controls:Array<Array<Array<Bool>>> = [];

        for (i in 0...keyCount) {
            controls[i] = [];
            
            for (key in 0...keyBinds[i].length) {
                controls[i].push(checkPressed(keyBinds[i][key]));
            }

            var shouldStatic:Bool = true;
            for (check in 0...controls[i].length) {

                var curKey:Array<Bool> = controls[i][check];

                if (curKey[0]) {
                    figureOutHit(i);
                    shouldStatic = false;
                } else if (curKey[1]) {
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

            if (shouldStatic) playerStrums.members[i].playAnim("static");
        }
    }
}

function onCreatePost() {
    if (multiKey) {
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
    var text:String = Paths.getTextFromFile('Keybinds ' + keyCount + 'K.txt');
    
    if (text != null && text != '') {
        var fakeArray:Array<String> = text.split('||');
        for (i in 0...keyCount) keyBinds.push(fakeArray[i].split(','));
    }

    switch(keyCount) {
        case 1:
            if (keyBinds == null || keyBinds.length < keyCount) keyBinds = [['SPACE', 'null']];
        case 2:
            if (keyBinds == null || keyBinds.length < keyCount) keyBinds = [['A', 'LEFT'], ['D', 'RIGHT']];
        case 3:
            if (keyBinds == null || keyBinds.length < keyCount) keyBinds = [['A', 'LEFT'], ['S', 'DOWN'], ['D', 'RIGHT']];
        case 5:
            if (keyBinds == null || keyBinds.length < keyCount) keyBinds = [['A', 'LEFT'], ['S', 'DOWN'], ['SPACE', 'null'], ['W', 'UP'], ['D', 'RIGHT']];
        case 6:
            if (keyBinds == null || keyBinds.length < keyCount) keyBinds = [['A', 'LEFT'], ['S', 'DOWN'], ['D', 'RIGHT'], ['J', 'null'], ['K', 'null'], ['L', 'null']];
        case 7:
            if (keyBinds == null || keyBinds.length < keyCount) keyBinds = [['A', 'LEFT'], ['S', 'DOWN'], ['D', 'RIGHT'], ['SPACE', 'null'], ['J', 'null'], ['K', 'null'], ['L', 'null']];
        case 8:
            if (keyBinds == null || keyBinds.length < keyCount) keyBinds = [['A', 'LEFT'], ['S', 'DOWN'], ['D', 'RIGHT'], ['F', 'null'], ['SPACE', 'null'], ['H', 'null'], ['J', 'null'], ['K', 'null'], ['L', 'null']];
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
		FlxTween.tween(strum, {alpha: targetAlpha}, 1, {ease: FlxEase.circOut,	startDelay: 0.5 + (0.2 * strum.noteData)});
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
    for (note in unspawnNotes) {

        if (note.noteType == 'Hurt Note') note.extraData.set('canChangeRGB', false);

        if (note.extraData.get("realData") != null) note.noteData = Std.parseInt(note.extraData.get("realData"));

        if (note.noteData > keyCount - 1) note.noteData = 0;
    }
}

function getMultiTexture(texture:String):String {
    if (Paths.fileExists('images/' + texture + '-multi.png', 'IMAGE')) return texture + '-multi';
    else return 'noteSkins/NOTE_assets-multi';

}

function checkPressed(key:String):Array<Bool> //because i cant do any fancy stuff i guess
{
    switch (StringTools.trim(key.toUpperCase()))
    {
        case "A": return [FlxG.keys.justPressed.A, FlxG.keys.pressed.A];
        case "B": return [FlxG.keys.justPressed.B, FlxG.keys.pressed.B];
        case "C": return [FlxG.keys.justPressed.C, FlxG.keys.pressed.C];
        case "D": return [FlxG.keys.justPressed.D, FlxG.keys.pressed.D];
        case "E": return [FlxG.keys.justPressed.E, FlxG.keys.pressed.E];
        case "F": return [FlxG.keys.justPressed.F, FlxG.keys.pressed.F];
        case "G": return [FlxG.keys.justPressed.G, FlxG.keys.pressed.G];
        case "H": return [FlxG.keys.justPressed.H, FlxG.keys.pressed.H];
        case "I": return [FlxG.keys.justPressed.I, FlxG.keys.pressed.I];
        case "J": return [FlxG.keys.justPressed.J, FlxG.keys.pressed.J];
        case "K": return [FlxG.keys.justPressed.K, FlxG.keys.pressed.K];
        case "L": return [FlxG.keys.justPressed.L, FlxG.keys.pressed.L];
        case "M": return [FlxG.keys.justPressed.M, FlxG.keys.pressed.M];
        case "N": return [FlxG.keys.justPressed.N, FlxG.keys.pressed.N];
        case "O": return [FlxG.keys.justPressed.O, FlxG.keys.pressed.O];
        case "P": return [FlxG.keys.justPressed.P, FlxG.keys.pressed.P];
        case "Q": return [FlxG.keys.justPressed.Q, FlxG.keys.pressed.Q];
        case "R": return [FlxG.keys.justPressed.R, FlxG.keys.pressed.R];
        case "S": return [FlxG.keys.justPressed.S, FlxG.keys.pressed.S];
        case "T": return [FlxG.keys.justPressed.T, FlxG.keys.pressed.T];
        case "U": return [FlxG.keys.justPressed.U, FlxG.keys.pressed.U];
        case "V": return [FlxG.keys.justPressed.V, FlxG.keys.pressed.V];
        case "W": return [FlxG.keys.justPressed.W, FlxG.keys.pressed.W];
        case "X": return [FlxG.keys.justPressed.X, FlxG.keys.pressed.X];
        case "Y": return [FlxG.keys.justPressed.Y, FlxG.keys.pressed.Y];
        case "Z": return [FlxG.keys.justPressed.Z, FlxG.keys.pressed.Z];

        case "0", "ZERO": return [FlxG.keys.justPressed.ZERO, FlxG.keys.pressed.ZERO];
        case "1", "ONE": return [FlxG.keys.justPressed.ONE, FlxG.keys.pressed.ONE];
        case "2", "TWO": return [FlxG.keys.justPressed.TWO, FlxG.keys.pressed.TWO];
        case "3", "THREE": return [FlxG.keys.justPressed.THREE, FlxG.keys.pressed.THREE];
        case "4", "FOUR": return [FlxG.keys.justPressed.FOUR, FlxG.keys.pressed.FOUR];
        case "5", "FIVE": return [FlxG.keys.justPressed.FIVE, FlxG.keys.pressed.FIVE];
        case "6", "SIX": return [FlxG.keys.justPressed.SIX, FlxG.keys.pressed.SIX];
        case "7", "SEVEN": return [FlxG.keys.justPressed.SEVEN, FlxG.keys.pressed.SEVEN];
        case "8", "EIGHT": return [FlxG.keys.justPressed.EIGHT, FlxG.keys.pressed.EIGHT];
        case "9", "NINE": return [FlxG.keys.justPressed.NINE, FlxG.keys.pressed.NINE];

        case "NUMPAD0": return [FlxG.keys.justPressed.NUMPADZERO, FlxG.keys.pressed.NUMPADZERO];
        case "NUMPAD1": return [FlxG.keys.justPressed.NUMPADONE, FlxG.keys.pressed.NUMPADONE];
        case "NUMPAD2": return [FlxG.keys.justPressed.NUMPADTWO, FlxG.keys.pressed.NUMPADTWO];
        case "NUMPAD3": return [FlxG.keys.justPressed.NUMPADTHREE, FlxG.keys.pressed.NUMPADTHREE];
        case "NUMPAD4": return [FlxG.keys.justPressed.NUMPADFOUR, FlxG.keys.pressed.NUMPADFOUR];
        case "NUMPAD5": return [FlxG.keys.justPressed.NUMPADFIVE, FlxG.keys.pressed.NUMPADFIVE];
        case "NUMPAD6": return [FlxG.keys.justPressed.NUMPADSIX, FlxG.keys.pressed.NUMPADSIX];
        case "NUMPAD7": return [FlxG.keys.justPressed.NUMPADSEVEN, FlxG.keys.pressed.NUMPADSEVEN];
        case "NUMPAD8": return [FlxG.keys.justPressed.NUMPADEIGHT, FlxG.keys.pressed.NUMPADEIGHT];
        case "NUMPAD9": return [FlxG.keys.justPressed.NUMPADNINE, FlxG.keys.pressed.NUMPADNINE];
        case "NUMPADPLUS": return [FlxG.keys.justPressed.NUMPADPLUS, FlxG.keys.pressed.NUMPADPLUS];
        case "NUMPADMINUS": return [FlxG.keys.justPressed.NUMPADMINUS, FlxG.keys.pressed.NUMPADMINUS];
        case "NUMPADMULTIPLY": return [FlxG.keys.justPressed.NUMPADMULTIPLY, FlxG.keys.pressed.NUMPADMULTIPLY];
        case "NUMPADPERIOD": return [FlxG.keys.justPressed.NUMPADPERIOD, FlxG.keys.pressed.NUMPADPERIOD];

        case "F1": return [FlxG.keys.justPressed.F1, FlxG.keys.pressed.F1];
        case "F2": return [FlxG.keys.justPressed.F2, FlxG.keys.pressed.F2];
        case "F3": return [FlxG.keys.justPressed.F3, FlxG.keys.pressed.F3];
        case "F4": return [FlxG.keys.justPressed.F4, FlxG.keys.pressed.F4];
        case "F5": return [FlxG.keys.justPressed.F5, FlxG.keys.pressed.F5];
        case "F6": return [FlxG.keys.justPressed.F6, FlxG.keys.pressed.F6];
        case "F7": return [FlxG.keys.justPressed.F7, FlxG.keys.pressed.F7];
        case "F8": return [FlxG.keys.justPressed.F8, FlxG.keys.pressed.F8];
        case "F9": return [FlxG.keys.justPressed.F9, FlxG.keys.pressed.F9];
        case "F10": return [FlxG.keys.justPressed.F10, FlxG.keys.pressed.F10];
        case "F11": return [FlxG.keys.justPressed.F11, FlxG.keys.pressed.F11];
        case "F12": return [FlxG.keys.justPressed.F12, FlxG.keys.pressed.F12];

        case "SPACE": return [FlxG.keys.justPressed.SPACE, FlxG.keys.pressed.SPACE];
        case "ENTER": return [FlxG.keys.justPressed.ENTER, FlxG.keys.pressed.ENTER];
        case "ESCAPE": return [FlxG.keys.justPressed.ESCAPE, FlxG.keys.pressed.ESCAPE];
        case "BACKSPACE": return [FlxG.keys.justPressed.BACKSPACE, FlxG.keys.pressed.BACKSPACE];
        case "TAB": return [FlxG.keys.justPressed.TAB, FlxG.keys.pressed.TAB];
        case "SHIFT": return [FlxG.keys.justPressed.SHIFT, FlxG.keys.pressed.SHIFT];
        case "CTRL": return [FlxG.keys.justPressed.CONTROL, FlxG.keys.pressed.CONTROL];
        case "ALT": return [FlxG.keys.justPressed.ALT, FlxG.keys.pressed.ALT];
        case "CAPSLOCK": return [FlxG.keys.justPressed.CAPSLOCK, FlxG.keys.pressed.CAPSLOCK];

        case "UP": return [FlxG.keys.justPressed.UP, FlxG.keys.pressed.UP];
        case "DOWN": return [FlxG.keys.justPressed.DOWN, FlxG.keys.pressed.DOWN];
        case "LEFT": return [FlxG.keys.justPressed.LEFT, FlxG.keys.pressed.LEFT];
        case "RIGHT": return [FlxG.keys.justPressed.RIGHT, FlxG.keys.pressed.RIGHT];

        case "INSERT": return [FlxG.keys.justPressed.INSERT, FlxG.keys.pressed.INSERT];
        case "DELETE": return [FlxG.keys.justPressed.DELETE, FlxG.keys.pressed.DELETE];
        case "HOME": return [FlxG.keys.justPressed.HOME, FlxG.keys.pressed.HOME];
        case "END": return [FlxG.keys.justPressed.END, FlxG.keys.pressed.END];
        case "PAGEUP": return [FlxG.keys.justPressed.PAGEUP, FlxG.keys.pressed.PAGEUP];
        case "PAGEDOWN": return [FlxG.keys.justPressed.PAGEDOWN, FlxG.keys.pressed.PAGEDOWN];

        case ";": return [FlxG.keys.justPressed.SEMICOLON, FlxG.keys.pressed.SEMICOLON];
        case "'": return [FlxG.keys.justPressed.QUOTE, FlxG.keys.pressed.QUOTE];
        case ",": return [FlxG.keys.justPressed.COMMA, FlxG.keys.pressed.COMMA];
        case ".": return [FlxG.keys.justPressed.PERIOD, FlxG.keys.pressed.PERIOD];
        case "/": return [FlxG.keys.justPressed.SLASH, FlxG.keys.pressed.SLASH];
        case "\\": return [FlxG.keys.justPressed.BACKSLASH, FlxG.keys.pressed.BACKSLASH];
        case "-": return [FlxG.keys.justPressed.MINUS, FlxG.keys.pressed.MINUS];
        case "=": return [FlxG.keys.justPressed.PLUS, FlxG.keys.pressed.PLUS];
        case "[": return [FlxG.keys.justPressed.LBRACKET, FlxG.keys.pressed.LBRACKET];
        case "]": return [FlxG.keys.justPressed.RBRACKET, FlxG.keys.pressed.RBRACKET];
        case "`": return [FlxG.keys.justPressed.GRAVEACCENT, FlxG.keys.pressed.GRAVEACCENT];

        default: return [false, false];
    }
}