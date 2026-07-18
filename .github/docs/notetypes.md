# NoteTypes

## How Do I Make A Compatible NoteType?
This is simple little timmy! Lets say you have a custom note all ready to go, but you want to tie it to a strum with a higher notedata. This is simple!

* For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.realData', #, true)
* For Haxe: note.extraData.set("realData", #);

## It Overwrites my RGB Colors!
Just add:

* For Lua: setPropertyFromGroup('unspawnNotes', i, 'extraData.canChange', #, false)
* For Haxe: note.extraData.set("canChange", false);

## It's Just Using The Default Noteskin!
It can't find your notetypes multikey texture, just make sure they're in the same spot.