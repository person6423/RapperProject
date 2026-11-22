local AssetLib = require "libraries.PersonsLoveLib"
local flux = require "libraries.flux"

local BPM = 102

local Rapper = {}
Rapper.__index = Rapper

function Rapper.new(icon, id)
    local self = setmetatable({}, Rapper)
    self.icon = icon
    self.id = id
    self.x = ChartXPosition - 4 * ChartIconSize
    self.movingToStart = false
    return self
end

function Rapper:draw()
    if self.x == ChartXPosition - 4 * ChartIconSize and self.movingToStart == false then return end

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
        self.x = ChartXPosition - 4 * ChartIconSize
    end

    if barProgress > 0.75 then
        if self.id == 1 and ChartPlayerButtonsFadeInCounter == -1 then
            ChartPlayerButtonsFadeInCounter = 0
        end

        if self.id == 1 and PlayerRapper.movingToStart == false and RapperTurn == 1 then
            PlayerRapper.movingToStart = true
        end
        if self.id == 2 and MasterRapper.movingToStart == false and RapperTurn == 2 then
            MasterRapper.movingToStart = true
        end

        if self.movingToStart then
            self.x = (ChartXPosition + barProgress * (ChartIconSize * ChartLength)) - 16 * ChartIconSize
        end
    end

    if oldChartBar ~= ChartBar then
        if RapperTurn == 2 then
            MasterRapper.movingToStart = false
            ChartPlayerButtonsFadeInCounter = -1
            Chart.refreshChart()
            RapperTurn = 1
        else
            PlayerRapper.movingToStart = false
            RapperTurn = 2
        end
    end
end

return Rapper