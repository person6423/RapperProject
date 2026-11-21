local AssetLib = require "PersonsLoveLib.AssetLib"

local ChartButton = {}
ChartButton.__index = ChartButton

function ChartButton.new(button, tileX)
    local self = setmetatable({}, ChartButton)
    self.button = button
    self.tileX = tileX
    self.posX = Chart.getChartIconPixelX(self.tileX)
    self.PressedTime = -1
    return self
end

function ChartButton:draw()
    local chartIconsSliced = AssetLib.sliceSheet(ImagesChartIcons, ChartIconSize, ChartIconSize)

    love.graphics.draw(ImagesChartIcons, chartIconsSliced[self.button], self.posX, ChartYPosition + self.PressedTime)
end

function ChartButton:update(dt)
    if PlayerPosX < self.posX then return end
    self.PressedTime = self.PressedTime + 1
end

return ChartButton