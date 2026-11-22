local AssetLib = require "PersonsLoveLib.AssetLib"

local BPM = 102

local Rapper = {}
Rapper.__index = Rapper

function Rapper.new(icon, id)
    local self = setmetatable({}, Rapper)
    self.icon = icon
    self.id = id
    self.x = ChartXPosition
    return self
end

function Rapper:draw()
    local rapperIconsSliced = AssetLib.sliceSheet(ImagesRapperIcons, ChartIconSize, ChartIconSize)
    love.graphics.draw(ImagesRapperIcons, rapperIconsSliced[self.icon], self.x, ChartYPosition + (self.id - 1) * ChartIconSize)
end

function Rapper:update(dt)
    local oldChartBar = ChartBar
    local songTime = MusicTrack:tell("seconds")
    local beat = songTime * BPM / 60
    ChartBar = math.floor(beat / 4)
    local barProgress = (beat % 4) / 4

    if self.id == RapperTurn then
        self.x = ChartXPosition + barProgress * (ChartIconSize * ChartLength)
    else
        self.x = ChartXPosition
    end

    if oldChartBar ~= ChartBar then
        if RapperTurn == 2 then
            Chart.refreshChart()
            RapperTurn = 1
        else
            RapperTurn = 2
        end
    end
end

return Rapper