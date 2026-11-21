local AssetLib = require "PersonsLoveLib.AssetLib"

local Chart = {}

function Chart.getChartIconPixelX(ChartTileX)
    return ChartXPosition + (ChartTileX * ChartIconSize)
end

function Chart.refreshChart()
    for i = #ChartButtons, 1, -1 do
        table.remove(ChartButtons, i)
    end

    table.insert(ChartButtons, ChartButton.new(math.random(1, 6), 4))
    table.insert(ChartButtons, ChartButton.new(math.random(1, 6), 8))
    table.insert(ChartButtons, ChartButton.new(math.random(1, 6), 12))
end

function Chart.draw()
    local chartIconsSliced = AssetLib.sliceSheet(ImagesChartIcons, ChartIconSize, ChartIconSize)

    for i = 0, ChartLength - 1 do
        local ClipToUse = chartIconsSliced[7]
        local IconX = Chart.getChartIconPixelX(i)
        if (i) % 4 == 0 then
            ClipToUse = chartIconsSliced[8]
        end

        love.graphics.draw(ImagesChartIcons, ClipToUse, IconX, ChartYPosition)

        if IconX < PlayerPosX then
            love.graphics.setBlendMode("add")
            love.graphics.draw(ImagesChartIcons, ClipToUse, IconX, ChartYPosition)
            love.graphics.setBlendMode("alpha")
        end
    end
end

return Chart