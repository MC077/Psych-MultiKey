import flixel.FlxG;

import backend.ClientPrefs;

import objects.StrumNote;

function onCreatePost() {
    callOnHScript('updateNoteDatas');
    for (note in unspawnNotes) {
        var name:String = note.animation.curAnim.name;

        if (!note.isSustainNote) {
			var graphic = Paths.image(callOnHScript('getMultiTexture', [note.texture]));
			note.loadGraphic(graphic, true, Math.floor(graphic.width / 10), Math.floor(graphic.height / 5));

            note.animation.add('Scroll', [14], 24, true);
            note.animation.play("Scroll");
        } else {
            var graphic = Paths.image(callOnHScript('getMultiTexture', [note.texture, true]));
			note.loadGraphic(graphic, true, Math.floor(graphic.width / 2), Math.floor(graphic.height / 2));

            if (StringTools.endsWith(name, 'end')) {
		        note.animation.add('holdend', [2], 24, true);
                note.animation.play("holdend");
            } else {
		        note.animation.add('hold', [0], 24, true);
                note.animation.play("hold");
            }
        }
        note.updateHitbox();

        if (note.extraData.get('canChangeRGB') == null || note.extraData.get('canChangeRGB')) {
            note.extraData.set('canChangeRGB', true);
            if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.rgbShader.r = 0xFFCCCCCC;
            if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.rgbShader.g = 0xFFFBFBFB;
            if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.rgbShader.b = 0xFF3E3E3E;

            if (note.extraData.get('canChangeR') == null || note.extraData.get('canChangeR') == true) note.noteSplashData.r = 0xFFCCCCCC;
            if (note.extraData.get('canChangeG') == null || note.extraData.get('canChangeG') == true) note.noteSplashData.g = 0xFFFBFBFB;
            if (note.extraData.get('canChangeB') == null || note.extraData.get('canChangeB') == true) note.noteSplashData.b = 0xFF3E3E3E;
        }
        
        note.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
        note.noteSplashData.enabled = !PlayState.SONG.disableNoteRGB;
    }

}

function generateStaticArrows(player:Int) {
	var strumLineX:Float = ClientPrefs.data.middleScroll ? 50 : 125;
	var strumLineY:Float = ClientPrefs.data.downScroll ? (FlxG.height - 150) : 50;
    

	var babyArrow:StrumNote = new StrumNote(strumLineX, strumLineY, 0, player);
	var graphic = Paths.image(callOnHScript('getMultiTexture', [babyArrow.texture]));
	babyArrow.downScroll = ClientPrefs.data.downScroll;
	babyArrow.loadGraphic(graphic, true, Math.floor(graphic.width / 10), Math.floor(graphic.height / 5));

    babyArrow.animation.add('static', [4], 24, true);
    babyArrow.animation.add('pressed', [14, 24], 24, false);
    babyArrow.animation.add('confirm', [34, 44], 24, false);

    babyArrow.rgbShader.r = 0xFFCCCCCC;
    babyArrow.rgbShader.g = 0xFFFBFBFB;
    babyArrow.rgbShader.b = 0xFF3E3E3E;
    babyArrow.noteData = 0;
    babyArrow.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
    babyArrow.playAnim('static');
    babyArrow.updateHitbox();

	strumLineNotes.add(babyArrow);
    if (player > 0) {
        if (!ClientPrefs.data.middleScroll) babyArrow.x += 175;
        playerStrums.add(babyArrow);
    }
    else {
        if (ClientPrefs.data.middleScroll) babyArrow.x += 325;
        opponentStrums.add(babyArrow);
    }
	babyArrow.playerPosition();

    callOnHScript('tweenNoteIn', [player, babyArrow]);
}

function onCountdownStarted() {
    for (strum in game.strumLineNotes) game.strumLineNotes.remove(strum);
    for (strum in game.playerStrums) game.playerStrums.remove(strum);
    for (strum in game.opponentStrums) game.opponentStrums.remove(strum);
	generateStaticArrows(0);
	generateStaticArrows(1);
}

var singDirections:Array<String> = ['LEFT', 'DOWN', 'UP', 'RIGHT'];

function goodNoteHit(note:Note) boyfriend.playAnim('sing' + singDirections[2] + note.animSuffix, true);

function noteMiss(note:Note) boyfriend.playAnim('sing' + singDirections[2] + 'miss' + note.animSuffix, true);

function opponentNoteHit(note:Note) dad.playAnim('sing' + singDirections[2] + note.animSuffix, true);