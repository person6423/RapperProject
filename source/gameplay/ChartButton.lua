local PersonsLoveLib = require "libraries.PersonsLoveLib"
local flux = require "libraries.flux"
local Assets = require "source.misc.Assets"

local ChartButton = {}
ChartButton.__index = ChartButton

function ChartButton.newSingleButton(button, tileX, forRapper)
    local self = setmetatable({}, ChartButton)
    self.button = button
    self.tileX = tileX
    self.posX = Chart.getChartIconPixelX(self.tileX)
    self.pressedTime = -1
    self.width = 2
    self.height = 0
    self.scale = 0.75
    self.colour = {1, 1, 1, 0}
    self.additive = 0
    self.forRapper = forRapper
    return self
end

function ChartButton.newButton(button, tileX)
    table.insert(MasterChartButtons, ChartButton.newSingleButton(button, tileX, MasterRapper))
    table.insert(PlayerChartButtons, ChartButton.newSingleButton(button, tileX, PlayerRapper))
end

function ChartButton:draw()
    for draws = 1, 2 do
        love.graphics.setColor(self.colour[1], self.colour[2], self.colour[3], self.colour[4])
        if draws > 1 then
            love.graphics.setColor(self.colour[1], self.colour[2], self.colour[3], self.additive)
            love.graphics.setBlendMode("add")
        end
        love.graphics.draw(
        Assets.images.ChartIcons, --Image
        Assets.quads.ChartIcons[self.button], --Quad
        self.posX + ChartIconSize / 2, --X position
        (ChartYPosition + ChartIconSize / 2) + (self.forRapper.id - 1) * ChartIconSize, --Y position
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
    if self.forRapper.id == 2 and ChartPlayerButtonsFadeInCounter == 1 then
        flux.to(self.colour, 0.5, {[4] = 0.75}):ease("sineout")
        flux.to(self, 0.5, {width = 1, height = 1}):ease("sineout")
    end

    if self.forRapper.x < self.posX or self.pressedTime > -1 then return end

    self.pressedTime = self.pressedTime + 1

    self.colour = {1, 1, 1, 1}
    self.width = 1
    self.height = 1
    self.additive = 1
    self.scale = 1.75
    flux.to(self, 0.4, {scale = 1, additive = 0}):ease("sineout")
    flux.to(self, 0.4, {width = -1}):ease("sineinout"):after(self, 0.4, {width = 1}):ease("sineinout")
end

return ChartButton