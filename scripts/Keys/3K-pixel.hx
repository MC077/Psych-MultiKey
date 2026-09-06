import flixel.FlxG;

import backend.ClientPrefs;

import objects.StrumNote;

function onCreatePost() {
    callOnHScript('updateNoteDatas');
    for (note in unspawnNotes) {
        switch(note.noteData) {
            case 0:
                if (!note.isSustainNote) {
                    note.animation.add('Scroll', [4], 24, true);
                    note.animation.play("Scroll");
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
                    note.animation.add('Scroll', [5], 24, true);
                    note.animation.play("Scroll");
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
                    note.animation.add('Scroll', [7], 24, true);
                    note.animation.play("Scroll");
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
        note.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
        note.noteSplashData.enabled = !PlayState.SONG.disableNoteRGB;
    }
}

function generateStaticArrows(player:Int) {
	var strumLineX:Float = ClientPrefs.data.middleScroll ? -392.5 : 16;
	var strumLineY:Float = ClientPrefs.data.downScroll ? (FlxG.height - 150) : 50;

	for (i in 0...3)
	{
		var babyArrow:StrumNote = new StrumNote(strumLineX, strumLineY, 0, player);
		babyArrow.downScroll = ClientPrefs.data.downScroll;

        switch(i) {
            case 0:
                babyArrow.animation.add('static', [0], 24, true);
                babyArrow.animation.add('confirm', [12, 16], 24, false);
                babyArrow.animation.add('pressed', [4, 8], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[0][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[0][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[0][2];
            case 1:
                babyArrow.animation.add('static', [1], 24, true);
                babyArrow.animation.add('confirm', [13, 17], 24, false);
                babyArrow.animation.add('pressed', [5, 9], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[1][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[1][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[1][2];
            case 2:
                babyArrow.animation.add('static', [3], 24, true);
                babyArrow.animation.add('confirm', [15, 19], 24, false);
                babyArrow.animation.add('pressed', [7, 11], 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGBPixel[3][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGBPixel[3][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGBPixel[3][2];
        }
        babyArrow.noteData = i;
        babyArrow.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
        babyArrow.playAnim('static');
		strumLineNotes.add(babyArrow);
        if (player > 0) {
            babyArrow.x += 175;
            playerStrums.add(babyArrow);
        }
        else opponentStrums.add(babyArrow);
		babyArrow.playerPosition();
        if (ClientPrefs.data.middleScroll && player == 0) if (i > 1) babyArrow.x += 1075; else babyArrow.x += 450;

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
    }

    dad.playAnim(anim + note.animSuffix, true);
}