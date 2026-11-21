local BPM = 102

local Rapper = {}

function Rapper.draw()
    love.graphics.draw(ImagesRapperIcons, PlayerPosX, ChartYPosition)
end

function Rapper.update(dt)
    local songTime = MusicTrack:tell("seconds")
    local beat = songTime * BPM / 60
    local bar = math.floor(beat / 4)
    local barProgress = (beat % 4) / 4
    ChartBar = bar % 6

    PlayerPosX = ChartXPosition + barProgress * (ChartIconSize * ChartLength)
end

return Rapper