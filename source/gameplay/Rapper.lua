local BPM = 102

local Rapper = {}

function Rapper.draw()
    love.graphics.draw(ImagesRapperIcons, PlayerPosX, ChartYPosition)
end

function Rapper.update(dt)
    local oldChartBar = ChartBar
    local songTime = MusicTrack:tell("seconds")
    local beat = songTime * BPM / 60
    ChartBar = math.floor(beat / 4)
    local barProgress = (beat % 4) / 4

    if oldChartBar ~= ChartBar then
        Chart.refreshChart()
    end

    PlayerPosX = ChartXPosition + barProgress * (ChartIconSize * ChartLength)
end

return Rapper