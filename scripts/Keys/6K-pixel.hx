import flixel.FlxG;

import backend.ClientPrefs;

import objects.StrumNote;

var scale:Float = PlayState.daPixelZoom * 0.8;

function onCreatePost() {
    callOnHScript('updateNoteDatas');
    for (note in unspawnNotes) {
        if (!note.isSustainNote) {
            note.scale.set(scale, scale);
            note.offsetX += 10;
        }
        else {
            note.scale.x = scale; //do it this way to avoid breaking sustains
            note.offsetX += 4;
        }

        switch(note.noteData) {
            case 0:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [4]);
                    note.animation.play('Note');
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
                    note.animation.add('Note', [5]);
                    note.animation.play('Note');
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
                    note.animation.add('Note', [7]);
                    note.animation.play('Note');
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
                    note.animation.add('Note', [4]);
                    note.animation.play('Note');
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
            case 4:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [6]);
                    note.animation.play('Note');
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
            case 5:
                if (!note.isSustainNote) {
                    note.animation.add('Note', [7]);
                    note.animation.play('Note');
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
	var strumLineX:Float = ClientPrefs.data.middleScroll ? -322.5 : -1.5;
	var strumLineY:Float = ClientPrefs.data.downScroll ? (FlxG.height - 150) : 50;

	for (i in 0...6)
	{
		var babyArrow:StrumNote = new StrumNote(strumLineX, strumLineY, 0, player);
		babyArrow.downScroll = ClientPrefs.data.downScroll;
        babyArrow.scale.set(scale, scale);

        switch(i) {
            case 0:
				babyArrow.animation.add('static', [0]);
				babyArrow.animation.add('pressed', [4, 8], 12, false);
				babyArrow.animation.add('confirm', [12, 16], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[0][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[0][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[0][2];
            case 1:
			    babyArrow.animation.add('static', [1]);
			    babyArrow.animation.add('pressed', [5, 9], 12, false);
			    babyArrow.animation.add('confirm', [13, 17], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[1][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[1][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[1][2];
            case 2:
				babyArrow.animation.add('static', [3]);
				babyArrow.animation.add('pressed', [7, 11], 12, false);
				babyArrow.animation.add('confirm', [15, 19], 24, false);

                babyArrow.rgbShader.r = 0xFF0033FF;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF000066;
            case 3:
				babyArrow.animation.add('static', [0]);
				babyArrow.animation.add('pressed', [4, 8], 12, false);
				babyArrow.animation.add('confirm', [12, 16], 24, false);

                babyArrow.rgbShader.r = 0xFFFFFF00;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF993300;
            case 4:
				babyArrow.animation.add('static', [2]);
				babyArrow.animation.add('pressed', [6, 10], 12, false);
				babyArrow.animation.add('confirm', [14, 18], 12, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[2][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[2][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[2][2];
            case 5:
				babyArrow.animation.add('static', [3]);
				babyArrow.animation.add('pressed', [7, 11], 12, false);
				babyArrow.animation.add('confirm', [15, 19], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGB[3][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGB[3][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGB[3][2];
        }
        babyArrow.noteData = i;
        babyArrow.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
        babyArrow.playAnim('static');
        babyArrow.x -= 25 * i;
		strumLineNotes.add(babyArrow);
        if (player > 0) playerStrums.add(babyArrow);
        else opponentStrums.add(babyArrow);
		babyArrow.playerPosition();

        if (ClientPrefs.data.middleScroll && player == 0) if (i > 2) babyArrow.x += 950; else babyArrow.x += 325;

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
            anim = anim + singDirections[0];
        case 4:
            anim = anim + singDirections[2];
        case 5:
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
            anim = anim + singDirections[0] + 'miss';
        case 4:
            anim = anim + singDirections[2] + 'miss';
        case 5:
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
            anim = anim + singDirections[0];
        case 4:
            anim = anim + singDirections[2];
        case 5:
            anim = anim + singDirections[3];
    }

    dad.playAnim(anim + note.animSuffix, true);
}