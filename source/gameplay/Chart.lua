local AssetLib = require "PersonsLoveLib.AssetLib"

local Chart = {}

function Chart.getChartIconPixelX(ChartTileX)
    return ChartXPosition + (ChartTileX * ChartIconSize)
end

function Chart.refreshChart()
    for i = #MasterChartButtons, 1, -1 do
        table.remove(MasterChartButtons, i)
    end
    for i = #PlayerChartButtons, 1, -1 do
        table.remove(PlayerChartButtons, i)
    end

    ChartButton.newButton(math.random(1, 6), 4)
    ChartButton.newButton(math.random(1, 6), 8)
    ChartButton.newButton(math.random(1, 6), 12)
end

function Chart.drawChart(rapper)
    local chartIconsSliced = AssetLib.sliceSheet(ImagesChartIcons, ChartIconSize, ChartIconSize)
    local Yposition = ChartYPosition + (rapper.id - 1) * ChartIconSize

    for i = 0, ChartLength - 1 do
        local ClipToUse = chartIconsSliced[7]
        local IconX = Chart.getChartIconPixelX(i)
        if (i) % 4 == 0 then
            ClipToUse = chartIconsSliced[8]
        end

        love.graphics.draw(ImagesChartIcons, ClipToUse, IconX, Yposition)

        if IconX < rapper.x then
            love.graphics.setBlendMode("add")
            love.graphics.draw(ImagesChartIcons, ClipToUse, IconX, Yposition)
            love.graphics.setBlendMode("alpha")
        end
    end
end

function Chart.draw()
    Chart.drawChart(MasterRapper)
    Chart.drawChart(PlayerRapper)
end

return Chart