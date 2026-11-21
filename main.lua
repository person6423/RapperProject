ImagesChartIcons = nil
MusicTrack = nil

GamePlaying = false

ChartIconSize = 48
ChartLength = 16
ChartXPosition, ChartYPosition = (1280 - (ChartIconSize * ChartLength)) / 2, 30
ChartBar = 0

PlayerPosX = ChartXPosition

local function startGame()
    GamePlaying = true
    MusicTrack:play()
end

function love.load()
    love.graphics.setDefaultFilter("linear", "linear")

    ImagesChartIcons = love.graphics.newImage("assets/images/ChartIcons.png")
    ImagesRapperIcons = love.graphics.newImage("assets/images/RapperIcons.png")

    MusicTrack = love.audio.newSource("assets/music/EverythingIsNothing.wav", "stream")
    MusicTrack:setLooping(true)

    Chart = require "source.gameplay.Chart"
    ChartButton = require "source.gameplay.ChartButton"
    Rapper = require "source.gameplay.Rapper"

    love.timer.sleep(2)

    startGame()
end

function love.draw()
    if GamePlaying == false then return end
    Chart.draw()
    ChartButton.draw()
    Rapper.draw()
end

function love.update(dt)
    if GamePlaying == false then return end
    Rapper.update(dt)
end