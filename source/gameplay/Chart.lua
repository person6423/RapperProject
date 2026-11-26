local Assets = require "source.misc.Assets"

local Chart = {}

function Chart.getChartIconPixelX(ChartTileX)
    return ChartXPosition + (ChartTileX * ChartIconSize)
end

function Chart.initializeChart(refreshing)
    print((refreshing and "Refreshing" or "Initializing") .. " chart...")

    for i = #MasterChartButtons, 1, -1 do
        table.remove(MasterChartButtons, i)
    end
    for i = #PlayerChartButtons, 1, -1 do
        table.remove(PlayerChartButtons, i)
    end

    local stageData = love.filesystem.load("source/stageData/Stage" .. StageID .. "/StageData" .. StageID .. ".lua")()

    for _, barTable in ipairs(stageData.chart) do --loop through every bar

        for __, chartBars in pairs(barTable.chartBars) do -- loop through every chartbars item in bar

            if chartBars == ChartBar then -- if chartbars item is the current chart bar

                for _, noteTable in ipairs(barTable.notes) do -- loop through every note in bar
                    ChartButton.newButton(noteTable.type, noteTable.tileX)
                end

                break -- stop loop
            end

        end

    end

    if refreshing then return end

    Music.bpm = 60
    Music.songAsset = nil

    Music.bpm = stageData.bpm
    Music.songAsset = stageData.songAsset

    Music.songAsset:play()
end

function Chart.drawChart(rapper)
    local Yposition = ChartYPosition + (rapper.id - 1) * ChartIconSize

    for i = 0, ChartLength - 1 do
        local ClipToUse = Assets.quads.ChartIcons[8]
        local IconX = Chart.getChartIconPixelX(i)
        if (i) % 4 == 0 then
            ClipToUse = Assets.quads.ChartIcons[9]
        end

        love.graphics.draw(Assets.images.ChartIcons, ClipToUse, IconX, Yposition)

        if IconX < rapper.x then
            love.graphics.setBlendMode("add")
            love.graphics.draw(Assets.images.ChartIcons, ClipToUse, IconX, Yposition)
            love.graphics.setBlendMode("alpha")
        end
    end
end

function Chart.draw()
    Chart.drawChart(MasterRapper)
    Chart.drawChart(PlayerRapper)
end

return Chart