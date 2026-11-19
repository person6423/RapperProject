local Chart = require "source.gameplay.Chart"

ImagesChartIcons = nil

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    ImagesChartIcons = love.graphics.newImage("assets/images/ChartIcons.png")

    Chart.setChartPosition()
end

function love.draw()
    Chart.draw()
end