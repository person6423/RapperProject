ImagesChartIcons = nil

ChartIconSize = 48
ChartLength = 16
ChartXPosition, ChartYPosition = (1280 - (ChartIconSize * ChartLength)) / 2, 30
ChartBar = 0

PlayerPosX = ChartXPosition - (ChartIconSize * 4)

function love.load()
    love.graphics.setDefaultFilter("linear", "linear")

    ImagesChartIcons = love.graphics.newImage("assets/images/ChartIcons.png")
    ImagesRapperIcons = love.graphics.newImage("assets/images/RapperIcons.png")

    Chart = require "source.gameplay.Chart"
    Rapper = require "source.gameplay.Rapper"
end

function love.draw()
    Chart.draw()
    Rapper.draw()
end

function love.update(dt)
    Rapper.update(dt)
end