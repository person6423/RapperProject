local flux = require "libraries.flux"

TargetFPS = 60

StageID = 21

ChartIconSize = 48
ChartLength = 16
ChartXPosition, ChartYPosition = (1280 - (ChartIconSize * ChartLength)) / 2, 30
MasterChartButtons = {}
PlayerChartButtons = {}
ChartBar = 0
ChartPlayerButtonsFadeInCounter = -1
FlowerMode = false

MasterRapper = nil
PlayerRapper = nil
RapperTurn = 1
RapperStartingPos = ChartXPosition - 4 * ChartIconSize

local nextFrame = love.timer.getTime()

function love.load()
    love.graphics.setDefaultFilter("linear", "linear")

    Assets = require "source.misc.Assets"
    Assets.loadAssetGroup("Chart")
    Assets.loadAssetGroup("Stage" .. StageID)

    Music = require "source.gameplay.Music"
    Chart = require "source.gameplay.Chart"
    ChartButton = require "source.gameplay.ChartButton"
    Rapper = require "source.gameplay.Rapper"
    DebugUI = require "source.ui.DebugUI"

    MasterRapper = Rapper.new(1, 1)
    PlayerRapper = Rapper.new(2, 2)

    if FlowerMode then
        print("Flower Mode is ENABLED!")
    end

    Chart.initializeChart(false)
end

function love.draw()
    love.graphics.setColor(0.025, 0.05, 0.1, 1)
    love.graphics.rectangle("fill", 0, 0, 1280, 720)
    love.graphics.setColor(1, 1, 1, 1)

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
    Music.update(dt)
    for _, i in ipairs(MasterChartButtons) do i:update(dt) end
    for _, i in ipairs(PlayerChartButtons) do i:update(dt) end
    MasterRapper:update(dt)
    PlayerRapper:update(dt)
    flux.update(dt)
    nextFrame = nextFrame + 1 / TargetFPS
end