local Music = require "source.gameplay.Music"
local Assets = require "source.misc.Assets"

local Rapper = {}
Rapper.__index = Rapper

function Rapper.new(icon, id)
    local self = setmetatable({}, Rapper)
    self.icon = icon
    self.id = id
    self.x = RapperStartingPos
    self.movingToStart = false
    return self
end

function Rapper:draw()
    if self.x == RapperStartingPos and self.movingToStart == false then return end

    love.graphics.draw(Assets.images.RapperIcons, Assets.quads.RapperIcons[self.icon], self.x, ChartYPosition + (self.id - 1) * ChartIconSize)
end

function Rapper:update(dt)
    local oldChartBar = ChartBar
    ChartBar = math.floor(Music.currentBeat / 4)
    local barProgress = (Music.currentBeat % 4) / 4

    if self.id == RapperTurn then
        self.x = ChartXPosition + barProgress * (ChartIconSize * ChartLength)
    else
        self.x = RapperStartingPos
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