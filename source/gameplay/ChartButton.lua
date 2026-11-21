local AssetLib = require "PersonsLoveLib.AssetLib"

local ChartButton = {}

function ChartButton.draw()
    local chartIconsSliced = AssetLib.sliceSheet(ImagesChartIcons, ChartIconSize, ChartIconSize)

    for i = 0, ChartBar do
        love.graphics.draw(ImagesChartIcons, chartIconsSliced[ChartBar + 1], Chart.getChartIconPixelX(ChartBar + (i * 2)), ChartYPosition)
    end
end

return ChartButton