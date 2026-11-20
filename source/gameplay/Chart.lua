local AssetLib = require "PersonsLoveLib.AssetLib"

local Chart = {}

function Chart.getChartIconPixelX(ChartTileX)
    return ChartXPosition + (ChartTileX * ChartIconSize)
end

function Chart.draw()
    local chartIconsSliced = AssetLib.sliceSheet(ImagesChartIcons, ChartIconSize, ChartIconSize)

    for i = 0, ChartLength - 1 do
        local ClipToUse = chartIconsSliced[7]
        if (i) % 4 == 0 then
            ClipToUse = chartIconsSliced[8]
        end
        love.graphics.draw(ImagesChartIcons, ClipToUse, Chart.getChartIconPixelX(i), ChartYPosition)
    end

    love.graphics.draw(ImagesChartIcons, chartIconsSliced[1], Chart.getChartIconPixelX(0), ChartYPosition)
end

return Chart