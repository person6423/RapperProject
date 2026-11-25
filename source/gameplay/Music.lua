local Music = {}

Music.songAsset = nil
Music.bpm = 0
Music.songTime = 0
Music.beat = 0
Music.currentBeat = 0

function Music.update(dt)
    if Music.songAsset then
        Music.songTime = Music.songAsset:tell("seconds")
    end

    Music.beat = Music.bpm / 60
    Music.currentBeat = Music.songTime * Music.beat
end

return Music