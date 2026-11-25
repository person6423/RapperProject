local Assets = require "source.misc.Assets"

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

    if ChartBar % 4 == 0 then
        ChartButton.newButton(1, 0)
        ChartButton.newButton(2, 2)
        ChartButton.newButton(3, 4)
        ChartButton.newButton(4, 6)
        ChartButton.newButton(5, 8)
        ChartButton.newButton(6, 11)
    elseif ChartBar % 4 == 2 then
        ChartButton.newButton(4, 0)
        ChartButton.newButton(3, 2)
        ChartButton.newButton(2, 4)
        ChartButton.newButton(1, 6)
        ChartButton.newButton(5, 8)
        ChartButton.newButton(6, 10)
        ChartButton.newButton(5, 11)
    end
end

function Chart.drawChart(rapper)
    local Yposition = ChartYPosition + (rapper.id - 1) * ChartIconSize

    for i = 0, ChartLength - 1 do
        local ClipToUse = Assets.quads.ChartIcons[7]
        local IconX = Chart.getChartIconPixelX(i)
        if (i) % 4 == 0 then
            ClipToUse = Assets.quads.ChartIcons[8]
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