import flixel.FlxG;

import backend.ClientPrefs;

import objects.StrumNote;

var scale:Float = PlayState.daPixelZoom * 0.8;

function onCreatePost() {
    callOnHScript('updateNoteDatas');
    for (note in unspawnNotes) {
        var name:String = note.animation.curAnim.name;

        var graphic;

        if (!note.isSustainNote) {
			graphic = Paths.image(callOnHScript('getMultiTexture', [note.texture]));
			note.loadGraphic(graphic, true, Math.floor(graphic.width / 10), Math.floor(graphic.height / 5));
        } else {
            graphic = Paths.image(callOnHScript('getMultiTexture', [note.texture, true]));
			note.loadGraphic(graphic, true, Math.floor(graphic.width / 2), Math.floor(graphic.height / 2));
        }
        
        if (!note.isSustainNote) note.scale.set(scale, scale);
        else note.scale.x = scale; //do it this way to avoid breaking sustains
        switch(note.noteData) {
            case 0:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [10], 24, true);
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.add('holdend', [2], 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.add('hold', [0], 24, true);
                        note.animation.play("hold");
                    }
                }
                
                if (note.extraData.get('canChangeRGB') == null || note.extraData.get('canChangeRGB') == true) {
                    note.extraData.set('canChangeRGB', true);
                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.rgbShader.r = ClientPrefs.data.arrowRGBPixel[0][0];
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.rgbShader.g = ClientPrefs.data.arrowRGBPixel[0][1];
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.rgbShader.b = ClientPrefs.data.arrowRGBPixel[0][2];

                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.noteSplashData.r = ClientPrefs.data.arrowRGBPixel[0][0];
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.noteSplashData.g = ClientPrefs.data.arrowRGBPixel[0][1];
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.noteSplashData.b = ClientPrefs.data.arrowRGBPixel[0][2];
                }
            case 1:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [11], 24, true);
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.add('holdend', [2], 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.add('hold', [0], 24, true);
                        note.animation.play("hold");
                    }
                }
                
                if (note.extraData.get('canChangeRGB') == null || note.extraData.get('canChangeRGB') == true) {
                    note.extraData.set('canChangeRGB', true);
                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.rgbShader.r = ClientPrefs.data.arrowRGBPixel[1][0];
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.rgbShader.g = ClientPrefs.data.arrowRGBPixel[1][1];
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.rgbShader.b = ClientPrefs.data.arrowRGBPixel[1][2];

                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.noteSplashData.r = ClientPrefs.data.arrowRGBPixel[1][0];
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.noteSplashData.g = ClientPrefs.data.arrowRGBPixel[1][1];
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.noteSplashData.b = ClientPrefs.data.arrowRGBPixel[1][2];
                }
            case 2:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [13], 24, true);
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.add('holdend', [2], 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.add('hold', [0], 24, true);
                        note.animation.play("hold");
                    }
                }
                
                if (note.extraData.get('canChangeRGB') == null || note.extraData.get('canChangeRGB') == true) {
                    note.extraData.set('canChangeRGB', true);
                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.rgbShader.r = 0xFF0033FF;
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.rgbShader.g = 0xFFF2F4FF;
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.rgbShader.b = 0xFF000066;

                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.noteSplashData.r = 0xFF0033FF;
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.noteSplashData.g = 0xFFF2F4FF;
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.noteSplashData.b = 0xFF000066;
                }
            case 3:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [14], 24, true);
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.add('holdend', [2], 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.add('hold', [0], 24, true);
                        note.animation.play("hold");
                    }
                }
                
                if (note.extraData.get('canChangeRGB') == null || note.extraData.get('canChangeRGB') == true) {
                    note.extraData.set('canChangeRGB', true);
                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.rgbShader.r = 0xFFCCCCCC;
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.rgbShader.g = 0xFFFBFBFB;
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.rgbShader.b = 0xFF3E3E3E;

                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.noteSplashData.r = 0xFFCCCCCC;
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.noteSplashData.g = 0xFFFBFBFB;
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.noteSplashData.b = 0xFF3E3E3E;
                }
            case 4:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [10], 24, true);
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.add('holdend', [2], 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.add('hold', [0], 24, true);
                        note.animation.play("hold");
                    }
                }
                
                if (note.extraData.get('canChangeRGB') == null || note.extraData.get('canChangeRGB') == true) {
                    note.extraData.set('canChangeRGB', true);
                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.rgbShader.r = 0xFFFFE900;
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.rgbShader.g = 0xFFFFFDF2;
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.rgbShader.b = 0xFF993300;

                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.noteSplashData.r = 0xFFFFFF00;
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.noteSplashData.g = 0xFFFFFDF2;
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.noteSplashData.b = 0xFF993300;
                }
            case 5:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [12], 24, true);
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.add('holdend', [2], 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.add('hold', [0], 24, true);
                        note.animation.play("hold");
                    }
                }
                
                if (note.extraData.get('canChangeRGB') == null || note.extraData.get('canChangeRGB') == true) {
                    note.extraData.set('canChangeRGB', true);
                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.rgbShader.r = ClientPrefs.data.arrowRGBPixel[2][0];
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.rgbShader.g = ClientPrefs.data.arrowRGBPixel[2][1];
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.rgbShader.b = ClientPrefs.data.arrowRGBPixel[2][2];

                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.noteSplashData.r = ClientPrefs.data.arrowRGBPixel[2][0];
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.noteSplashData.g = ClientPrefs.data.arrowRGBPixel[2][1];
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.noteSplashData.b = ClientPrefs.data.arrowRGBPixel[2][2];
                }
            case 6:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [13], 24, true);
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.add('holdend', [2], 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.add('hold', [0], 24, true);
                        note.animation.play("hold");
                    }
                }
                
                if (note.extraData.get('canChangeRGB') == null || note.extraData.get('canChangeRGB') == true) {
                    note.extraData.set('canChangeRGB', true);
                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.rgbShader.r = ClientPrefs.data.arrowRGBPixel[3][0];
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.rgbShader.g = ClientPrefs.data.arrowRGBPixel[3][1];
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.rgbShader.b = ClientPrefs.data.arrowRGBPixel[3][2];

                    if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.noteSplashData.r = ClientPrefs.data.arrowRGBPixel[3][0];
                    if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.noteSplashData.g = ClientPrefs.data.arrowRGBPixel[3][1];
                    if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.noteSplashData.b = ClientPrefs.data.arrowRGBPixel[3][2];
                }
        }
        note.updateHitbox();
        note.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
        note.noteSplashData.enabled = !PlayState.SONG.disableNoteRGB;
    }
}

function generateStaticArrows(player:Int) {
	var strumLineX:Float = ClientPrefs.data.middleScroll ? -337.5 : -1.5;
	var strumLineY:Float = ClientPrefs.data.downScroll ? (FlxG.height - 150) : 50;

	for (i in 0...7)
	{
		var babyArrow:StrumNote = new StrumNote(strumLineX, strumLineY, 0, player);
		babyArrow.downScroll = ClientPrefs.data.downScroll;
	    var graphic = Paths.image(callOnHScript('getMultiTexture', [babyArrow.texture]));
	    babyArrow.loadGraphic(graphic, true, Math.floor(graphic.width / 10), Math.floor(graphic.height / 5));
        babyArrow.scale.set(scale, scale);
        babyArrow.updateHitbox();

        switch(i) {
            case 0:
                babyArrow.animation.add('static', [0], 24, true);
                babyArrow.animation.add('pressed', [10, 20], 24, false);
                babyArrow.animation.add('confirm', [30, 40], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[0][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[0][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[0][2];
            case 1:
                babyArrow.animation.add('static', [1], 24, true);
                babyArrow.animation.add('pressed', [11, 21], 24, false);
                babyArrow.animation.add('confirm', [31, 41], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[1][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[1][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[1][2];
            case 2:
                babyArrow.animation.add('static', [3], 24, true);
                babyArrow.animation.add('pressed', [13, 23], 24, false);
                babyArrow.animation.add('confirm', [33, 43], 24, false);

                babyArrow.rgbShader.r = 0xFF0033FF;
                babyArrow.rgbShader.g = 0xFFF2F4FF;
                babyArrow.rgbShader.b = 0xFF000066;
            case 3:
                babyArrow.animation.add('static', [4], 24, true);
                babyArrow.animation.add('pressed', [14, 24], 24, false);
                babyArrow.animation.add('confirm', [34, 44], 24, false);

                babyArrow.rgbShader.r = 0xFFCCCCCC;
                babyArrow.rgbShader.g = 0xFFFBFBFB;
                babyArrow.rgbShader.b = 0xFF3E3E3E;
            case 4:
                babyArrow.animation.add('static', [0], 24, true);
                babyArrow.animation.add('pressed', [10, 20], 24, false);
                babyArrow.animation.add('confirm', [30, 40], 24, false);

                babyArrow.rgbShader.r = 0xFFFFFF00;
                babyArrow.rgbShader.g = 0xFFFFFDF2;
                babyArrow.rgbShader.b = 0xFF993300;
            case 5:
                babyArrow.animation.add('static', [2], 24, true);
                babyArrow.animation.add('pressed', [12, 22], 24, false);
                babyArrow.animation.add('confirm', [32, 42], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[2][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[2][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[2][2];
            case 6:
                babyArrow.animation.add('static', [3], 24, true);
                babyArrow.animation.add('pressed', [13, 23], 24, false);
                babyArrow.animation.add('confirm', [33, 43], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[3][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[3][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[3][2];
        }
        babyArrow.noteData = i;
        babyArrow.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
        babyArrow.playAnim('static');
        babyArrow.x -= 35 * i;
        babyArrow.updateHitbox();
		strumLineNotes.add(babyArrow);
        if (player > 0) playerStrums.add(babyArrow);
        else opponentStrums.add(babyArrow);
		babyArrow.playerPosition();

        if (ClientPrefs.data.middleScroll && player == 0) if (i > 3) babyArrow.x += 950; else babyArrow.x += 300;

        callOnHScript('tweenNoteIn', [player, babyArrow]);
	}
    
}

function onCountdownStarted() {
    for (strum in game.strumLineNotes) game.strumLineNotes.remove(strum);
    for (strum in game.playerStrums) game.playerStrums.remove(strum);
    for (strum in game.opponentStrums) game.opponentStrums.remove(strum);
	generateStaticArrows(0);
	generateStaticArrows(1);
}

var singDirections:Array<String> = ['LEFT', 'DOWN', 'UP', 'RIGHT'];

function goodNoteHit(note:Note) {

    var anim:String = 'sing';
    
    switch(note.noteData) {
        case 0:
            anim = anim + singDirections[0];
        case 1:
            anim = anim + singDirections[1];
        case 2:
            anim = anim + singDirections[3];
        case 3:
            anim = anim + singDirections[2];
        case 4:
            anim = anim + singDirections[0];
        case 5:
            anim = anim + singDirections[2];
        case 6:
            anim = anim + singDirections[3];
    }

    boyfriend.playAnim(anim + note.animSuffix, true);
}

function noteMiss(note:Note) {

    var anim:String = 'sing';

    switch(note.noteData) {
        case 0:
            anim = anim + singDirections[0] + 'miss';
        case 1:
            anim = anim + singDirections[1] + 'miss';
        case 2:
            anim = anim + singDirections[3] + 'miss';
        case 3:
            anim = anim + singDirections[2] + 'miss';
        case 4:
            anim = anim + singDirections[0] + 'miss';
        case 5:
            anim = anim + singDirections[2] + 'miss';
        case 6:
            anim = anim + singDirections[3] + 'miss';
    }
    
    boyfriend.playAnim(anim + note.animSuffix, true);
}

function opponentNoteHit(note:Note) {

    var anim:String = 'sing';
    
    switch(note.noteData) {
        case 0:
            anim = anim + singDirections[0];
        case 1:
            anim = anim + singDirections[1];
        case 2:
            anim = anim + singDirections[3];
        case 3:
            anim = anim + singDirections[2];
        case 4:
            anim = anim + singDirections[0];
        case 5:
            anim = anim + singDirections[2];
        case 6:
            anim = anim + singDirections[3];
    }

    dad.playAnim(anim + note.animSuffix, true);
}