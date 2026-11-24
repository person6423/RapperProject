local Assets = require "source.misc.Assets"

local Music = {}

Music.bpm = 102
Music.songTime = 0
Music.beat = 0
Music.currentBeat = 0

function Music.update(dt)
    if Assets.audio.EverythingIsNothing then
        Music.songTime = Assets.audio.EverythingIsNothing:tell("seconds")
    end

    Music.beat = Music.bpm / 60
    Music.currentBeat = Music.songTime * Music.beat
end

return Music