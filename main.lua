local flux = require "flux"

TargetFPS = 60

ImagesChartIcons = nil
MusicTrack = nil

ChartIconSize = 48
ChartLength = 16
ChartXPosition, ChartYPosition = (1280 - (ChartIconSize * ChartLength)) / 2, 30
ChartButtons = {}
ChartBar = 0

PlayerPosX = ChartXPosition

local nextFrame = love.timer.getTime()

function love.load()
    love.graphics.setDefaultFilter("linear", "linear")

    ImagesChartIcons = love.graphics.newImage("assets/images/ChartIcons.png")
    ImagesRapperIcons = love.graphics.newImage("assets/images/RapperIcons.png")

    ImagesChartIcons:setFilter("linear", "nearest")

    MusicTrack = love.audio.newSource("assets/music/EverythingIsNothing.wav", "stream")
    MusicTrack:setLooping(true)

    Chart = require "source.gameplay.Chart"
    ChartButton = require "source.gameplay.ChartButton"
    Rapper = require "source.gameplay.Rapper"
    DebugUI = require "source.ui.DebugUI"

    Chart.refreshChart()

    MusicTrack:play()
end

function love.draw()
    Chart.draw()
    for _, i in ipairs(ChartButtons) do i:draw() end
    Rapper.draw()
    DebugUI.draw()

    local now = love.timer.getTime()
    if nextFrame <= now then
        nextFrame = now
    else
        love.timer.sleep(nextFrame - now)
    end
end

function love.update(dt)
    for _, i in ipairs(ChartButtons) do i:update(dt) end
    Rapper.update(dt)
    flux.update(dt)
    nextFrame = nextFrame + 1 / TargetFPS
end