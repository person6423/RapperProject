local flux = require "libraries.flux"

TargetFPS = 60

ImagesChartIcons = nil
MusicTrack = nil

ChartIconSize = 48
ChartLength = 16
ChartXPosition, ChartYPosition = (1280 - (ChartIconSize * ChartLength)) / 2, 30
MasterChartButtons = {}
PlayerChartButtons = {}
ChartBar = 0
ChartPlayerButtonsFadeInCounter = -1

MasterRapper = nil
PlayerRapper = nil
RapperTurn = 1

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

    MasterRapper = Rapper.new(1, 1)
    PlayerRapper = Rapper.new(2, 2)
    Chart.refreshChart()

    MusicTrack:play()
end

function love.draw()
    Chart.draw()
    for _, i in ipairs(MasterChartButtons) do i:draw() end
    for _, i in ipairs(PlayerChartButtons) do i:draw() end
    MasterRapper:draw()
    PlayerRapper:draw()
    DebugUI.draw()

    local now = love.timer.getTime()
    if nextFrame <= now then
        nextFrame = now
    else
        love.timer.sleep(nextFrame - now)
    end
end

function love.update(dt)
    if ChartPlayerButtonsFadeInCounter > -1 then
        ChartPlayerButtonsFadeInCounter = ChartPlayerButtonsFadeInCounter + 1
    end
    for _, i in ipairs(MasterChartButtons) do i:update(dt) end
    for _, i in ipairs(PlayerChartButtons) do i:update(dt) end
    MasterRapper:update(dt)
    PlayerRapper:update(dt)
    flux.update(dt)
    nextFrame = nextFrame + 1 / TargetFPS
end