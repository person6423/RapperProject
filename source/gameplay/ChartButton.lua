local AssetLib = require "PersonsLoveLib.AssetLib"
local flux = require "flux"

local ChartButton = {}
ChartButton.__index = ChartButton

function ChartButton.new(button, tileX)
    local self = setmetatable({}, ChartButton)
    self.button = button
    self.tileX = tileX
    self.posX = Chart.getChartIconPixelX(self.tileX)
    self.pressedTime = -1
    self.width = 1
    self.height = 1
    self.scale = 0.75
    self.colour = {1, 1, 1, 0.75}
    self.additive = 0
    return self
end

function ChartButton:draw()
    local chartIconsSliced = AssetLib.sliceSheet(ImagesChartIcons, ChartIconSize, ChartIconSize)

    for draws = 1, 2 do
        love.graphics.setColor(self.colour[1], self.colour[2], self.colour[3], self.colour[4])
        if draws > 1 then
            love.graphics.setColor(self.colour[1], self.colour[2], self.colour[3], self.additive)
            love.graphics.setBlendMode("add")
        end
        love.graphics.draw(
        ImagesChartIcons, --Image
        chartIconsSliced[self.button], --Quad
        self.posX + ChartIconSize / 2, --X position
        ChartYPosition + ChartIconSize / 2, --Y position
        0, --Rotation
        self.width * self.scale, --Width
        self.height * self.scale, --Height
        ChartIconSize / 2, --X Origin
        ChartIconSize / 2 --Y Origin
        )

        if not (self.additive > 0) then
            break
        end
    end

    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)
end

function ChartButton:update(dt)
    if PlayerPosX < self.posX or self.pressedTime > -1 then return end
    self.pressedTime = self.pressedTime + 1

    self.colour = {1, 1, 1, 1}
    self.additive = 1
    self.scale = 1.75
    flux.to(self, 0.5, {scale = 1, additive = 0}):ease("sineout")
end

return ChartButton