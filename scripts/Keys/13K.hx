import flixel.FlxG;

import backend.ClientPrefs;

import objects.StrumNote;

function onCreatePost() {
    for (note in unspawnNotes) {
        var name:String = note.animation.curAnim.name;
        note.reloadNote(callOnHScript('getMultiTexture', [note.texture]));
        if (!note.isSustainNote) note.scale.set(0.3, 0.3);
        else {
            note.scale.x = 0.3; //do it this way to avoid breaking sustains
            note.offsetY -= 24;
        }
        switch(note.noteData) {
            case 0:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'left 2');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 2', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 2', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFFFF0000;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF7F0000;

                    note.noteSplashData.r = 0xFFFF0000;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF7F0000;
                }
            case 1:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'left 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = ClientPrefs.data.arrowRGB[0][0];
                    note.rgbShader.g = ClientPrefs.data.arrowRGB[0][1];
                    note.rgbShader.b = ClientPrefs.data.arrowRGB[0][2];

                    note.noteSplashData.r = ClientPrefs.data.arrowRGB[0][0];
                    note.noteSplashData.g = ClientPrefs.data.arrowRGB[0][1];
                    note.noteSplashData.b = ClientPrefs.data.arrowRGB[0][2];
                }
            case 2:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'down 2');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 2', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 2', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFF1EFFFF;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF007E7E;

                    note.noteSplashData.r = 0xFF1EFFFF;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF007E7E;
                }
            case 3:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'down 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = ClientPrefs.data.arrowRGB[1][0];
                    note.rgbShader.g = ClientPrefs.data.arrowRGB[1][1];
                    note.rgbShader.b = ClientPrefs.data.arrowRGB[1][2];

                    note.noteSplashData.r = ClientPrefs.data.arrowRGB[1][0];
                    note.noteSplashData.g = ClientPrefs.data.arrowRGB[1][1];
                    note.noteSplashData.b = ClientPrefs.data.arrowRGB[1][2];
                }
            case 4:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'up 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = ClientPrefs.data.arrowRGB[2][0];
                    note.rgbShader.g = ClientPrefs.data.arrowRGB[2][1];
                    note.rgbShader.b = ClientPrefs.data.arrowRGB[2][2];

                    note.noteSplashData.r = ClientPrefs.data.arrowRGB[2][0];
                    note.noteSplashData.g = ClientPrefs.data.arrowRGB[2][1];
                    note.noteSplashData.b = ClientPrefs.data.arrowRGB[2][2];
                }
            case 5:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'right 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = ClientPrefs.data.arrowRGB[3][0];
                    note.rgbShader.g = ClientPrefs.data.arrowRGB[3][1];
                    note.rgbShader.b = ClientPrefs.data.arrowRGB[3][2];

                    note.noteSplashData.r = ClientPrefs.data.arrowRGB[3][0];
                    note.noteSplashData.g = ClientPrefs.data.arrowRGB[3][1];
                    note.noteSplashData.b = ClientPrefs.data.arrowRGB[3][2];
                }
            case 6:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'middle 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFFCCCCCC;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF3E3E3E;

                    note.noteSplashData.r = 0xFFCCCCCC;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF3E3E3E;
                }
            case 7:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'left 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFFFFFF00;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF993300;

                    note.noteSplashData.r = 0xFFFFFF00;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF993300;
                }
            case 8:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'down 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFF8B4AFF;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF3B177D;

                    note.noteSplashData.r = 0xFF8B4AFF;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF3B177D;
                }
            case 9:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'up 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFFFF0000;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF660000;

                    note.noteSplashData.r = 0xFFFF0000;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF660000;
                }
            case 10:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'up 2');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 2', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 2', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFF00FF21;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF007F0E;

                    note.noteSplashData.r = 0xFF00FF21;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF007F0E;
                }
            case 11:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'right 1');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 1', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 1', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFF0033FF;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF000066;

                    note.noteSplashData.r = 0xFF0033FF;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF000066;
                }
            case 12:
                if (!note.isSustainNote) {
                    note.animation.addByPrefix('Note', 'right 2');
                    note.animation.play('Note');
                } else {
                    if (StringTools.endsWith(name, 'end')) {
		                note.animation.addByPrefix('holdend', 'hold end 2', 24, true);
                        note.animation.play("holdend");
                    } else {
		                note.animation.addByPrefix('hold', 'hold 2', 24, true);
                        note.animation.play("hold");
                    }
                }
                if (note.extraData.get('canChangeRGB') == null) {
                    /*
                    For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChangeRGB', false, true)
                    For Haxe: note.extraData.set('canChangeRGB', false);

                    use these to DISABLE note rgb changes
                    */

                    note.extraData.set('canChangeRGB', true);
                    note.rgbShader.r = 0xFF1E29FF;
                    note.rgbShader.g = 0xFFFFFFFF;
                    note.rgbShader.b = 0xFF00067F;

                    note.noteSplashData.r = 0xFF1E29FF;
                    note.noteSplashData.g = 0xFFFFFFFF;
                    note.noteSplashData.b = 0xFF00067F;
                }
        }
        note.updateHitbox();
        note.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
        note.noteSplashData.enabled = !PlayState.SONG.disableNoteRGB;
    }
}

function generateStaticArrows(player:Int) {
	var strumLineX:Float = ClientPrefs.data.middleScroll ? -363 : -36.5;
	var strumLineY:Float = ClientPrefs.data.downScroll ? (FlxG.height - 150) : 50;

	for (i in 0...13)
	{
		var babyArrow:StrumNote = new StrumNote(strumLineX, strumLineY, 0, player);
		babyArrow.downScroll = ClientPrefs.data.downScroll;
        babyArrow.texture = callOnHScript('getMultiTexture', [babyArrow.texture]);
        babyArrow.scale.set(0.3, 0.3);

        switch(i) {
            case 0:
                babyArrow.animation.addByPrefix('static', 'arrowLEFT 2');
                babyArrow.animation.addByPrefix('confirm', 'left confirm 2', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'left press 2', 24, false);

                babyArrow.rgbShader.r = 0xFFFF0000;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF7F0000;
            case 1:
                babyArrow.animation.addByPrefix('static', 'arrowLEFT 1');
                babyArrow.animation.addByPrefix('confirm', 'left confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'left press 1', 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGB[0][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGB[0][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGB[0][2];
            case 2:
                babyArrow.animation.addByPrefix('static', 'arrowDOWN 2');
                babyArrow.animation.addByPrefix('confirm', 'down confirm 2', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'down press 2', 24, false);

                babyArrow.rgbShader.r = 0xFF1EFFFF;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF007E7E;
            case 3:
                babyArrow.animation.addByPrefix('static', 'arrowDOWN 1');
                babyArrow.animation.addByPrefix('confirm', 'down confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'down press 1', 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGB[1][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGB[1][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGB[1][2];
            case 4:
                babyArrow.animation.addByPrefix('static', 'arrowUP 1');
                babyArrow.animation.addByPrefix('confirm', 'up confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'up press 1', 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGB[2][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGB[2][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGB[2][2];
            case 5:
                babyArrow.animation.addByPrefix('static', 'arrowRIGHT 1');
                babyArrow.animation.addByPrefix('confirm', 'right confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'right press 1', 24, false);

                babyArrow.rgbShader.r = ClientPrefs.data.arrowRGB[3][0];
                babyArrow.rgbShader.g = ClientPrefs.data.arrowRGB[3][1];
                babyArrow.rgbShader.b = ClientPrefs.data.arrowRGB[3][2];
            case 6:
                babyArrow.animation.addByPrefix('static', 'arrowSPACE 1');
                babyArrow.animation.addByPrefix('confirm', 'middle confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'middle press 1', 24, false);

                babyArrow.rgbShader.r = 0xFFCCCCCC;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF3E3E3E;
            case 7:
                babyArrow.animation.addByPrefix('static', 'arrowLEFT 1');
                babyArrow.animation.addByPrefix('confirm', 'left confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'left press 1', 24, false);

                babyArrow.rgbShader.r = 0xFFFFFF00;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF993300;
            case 8:
                babyArrow.animation.addByPrefix('static', 'arrowDOWN 1');
                babyArrow.animation.addByPrefix('confirm', 'down confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'down press 1', 24, false);

                babyArrow.rgbShader.r = 0xFF8B4AFF;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF3B177D;
            case 9:
                babyArrow.animation.addByPrefix('static', 'arrowUP 1');
                babyArrow.animation.addByPrefix('confirm', 'up confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'up press 1', 24, false);

                babyArrow.rgbShader.r = 0xFFFF0000;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF660000;
            case 10:
                babyArrow.animation.addByPrefix('static', 'arrowUP 2');
                babyArrow.animation.addByPrefix('confirm', 'up confirm 2', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'up press 2', 24, false);

                babyArrow.rgbShader.r = 0xFF00FF21;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF007F0E;
            case 11:
                babyArrow.animation.addByPrefix('static', 'arrowRIGHT 1');
                babyArrow.animation.addByPrefix('confirm', 'right confirm 1', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'right press 1', 24, false);

                babyArrow.rgbShader.r = 0xFF0033FF;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF000066;
            case 12:
                babyArrow.animation.addByPrefix('static', 'arrowRIGHT 2');
                babyArrow.animation.addByPrefix('confirm', 'right confirm 2', 24, false);
                babyArrow.animation.addByPrefix('pressed', 'right press 2', 24, false);

                babyArrow.rgbShader.r = 0xFF1E29FF;
                babyArrow.rgbShader.g = 0xFFFFFFFF;
                babyArrow.rgbShader.b = 0xFF00067F;
        }
        babyArrow.noteData = i;
        babyArrow.rgbShader.enabled = !PlayState.SONG.disableNoteRGB;
        babyArrow.playAnim('static');
        babyArrow.x -= 65 * i;
        babyArrow.updateHitbox();
		strumLineNotes.add(babyArrow);
        if (player > 0) playerStrums.add(babyArrow);
        else opponentStrums.add(babyArrow);
		babyArrow.playerPosition();

        if (ClientPrefs.data.middleScroll && player == 0) if (i > 6) babyArrow.x += 940; else babyArrow.x += 320 - (5 * i);

        callOnHScript('tweenNoteIn', [player, babyArrow]);
	}
    callOnHScript('updateNoteDatas');
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
            anim = anim + singDirections[0];
        case 2:
            anim = anim + singDirections[1];
        case 3:
            anim = anim + singDirections[1];
        case 4:
            anim = anim + singDirections[2];
        case 5:
            anim = anim + singDirections[3];
        case 6:
            anim = anim + singDirections[2];
        case 7:
            anim = anim + singDirections[0];
        case 8:
            anim = anim + singDirections[1];
        case 9:
            anim = anim + singDirections[2];
        case 10:
            anim = anim + singDirections[2];
        case 11:
            anim = anim + singDirections[3];
        case 12:
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
            anim = anim + singDirections[0] + 'miss';
        case 2:
            anim = anim + singDirections[1] + 'miss';
        case 3:
            anim = anim + singDirections[1] + 'miss';
        case 4:
            anim = anim + singDirections[2] + 'miss';
        case 5:
            anim = anim + singDirections[3] + 'miss';
        case 6:
            anim = anim + singDirections[2] + 'miss';
        case 7:
            anim = anim + singDirections[0] + 'miss';
        case 8:
            anim = anim + singDirections[1] + 'miss';
        case 9:
            anim = anim + singDirections[2] + 'miss';
        case 10:
            anim = anim + singDirections[2] + 'miss';
        case 11:
            anim = anim + singDirections[3] + 'miss';
        case 12:
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
            anim = anim + singDirections[0];
        case 2:
            anim = anim + singDirections[1];
        case 3:
            anim = anim + singDirections[1];
        case 4:
            anim = anim + singDirections[2];
        case 5:
            anim = anim + singDirections[3];
        case 6:
            anim = anim + singDirections[2];
        case 7:
            anim = anim + singDirections[0];
        case 8:
            anim = anim + singDirections[1];
        case 9:
            anim = anim + singDirections[2];
        case 10:
            anim = anim + singDirections[2];
        case 11:
            anim = anim + singDirections[3];
        case 12:
            anim = anim + singDirections[3];
    }

    dad.playAnim(anim + note.animSuffix, true);
}