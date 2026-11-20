local Chart = require "source.gameplay.Chart"
local Rapper = require "source.gameplay.Rapper"

ImagesChartIcons = nil

function love.load()
    love.graphics.setDefaultFilter("linear", "linear")

    ImagesChartIcons = love.graphics.newImage("assets/images/ChartIcons.png")
    ImagesRapperIcons = love.graphics.newImage("assets/images/RapperIcons.png")

    Chart.setChartPosition()
end

function love.draw()
    Chart.draw()
    Rapper.draw()
end

function love.update(dt)
    Rapper.update(dt)
end