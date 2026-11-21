ImagesChartIcons = nil
MusicTrack = nil

ChartIconSize = 48
ChartLength = 16
ChartXPosition, ChartYPosition = (1280 - (ChartIconSize * ChartLength)) / 2, 30
ChartBar = 0

PlayerPosX = ChartXPosition

function love.load()
    love.graphics.setDefaultFilter("linear", "linear")

    ImagesChartIcons = love.graphics.newImage("assets/images/ChartIcons.png")
    ImagesRapperIcons = love.graphics.newImage("assets/images/RapperIcons.png")

    MusicTrack = love.audio.newSource("assets/music/EverythingIsNothing.wav", "stream")
    MusicTrack:setLooping(true)

    Chart = require "source.gameplay.Chart"
    ChartButton = require "source.gameplay.ChartButton"
    Rapper = require "source.gameplay.Rapper"

    MusicTrack:play()
end

function love.draw()
    Chart.draw()
    ChartButton.draw()
    Rapper.draw()
end

function love.update(dt)
    Rapper.update(dt)
end