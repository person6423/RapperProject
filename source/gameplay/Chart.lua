local AssetLib = require "PersonsLoveLib.AssetLib"

local Chart = {}

ChartScale = 1
ChartIconSize = 48
ChartXPosition, ChartYPosition = nil, nil

function Chart.setChartPosition()
    ChartXPosition = (1280 - (ChartIconSize * ChartScale * 18)) / 2
    ChartYPosition = 30
end

function Chart.draw()
    local chartIconsSliced = AssetLib.sliceSheet(ImagesChartIcons, ChartIconSize, ChartIconSize)

    for i = 0, 17 do
        local ClipToUse = chartIconsSliced[7]
        if (i - 2) % 4 == 0 then
            ClipToUse = chartIconsSliced[8]
        end
        love.graphics.draw(ImagesChartIcons, ClipToUse, ChartXPosition + i * ChartIconSize * ChartScale, ChartYPosition, 0, ChartScale, ChartScale)
    end

    for i = 0, 5 do
        love.graphics.draw(ImagesChartIcons, chartIconsSliced[i + 1], ChartXPosition + (i * 3) * ChartIconSize * ChartScale, ChartYPosition, 0, ChartScale, ChartScale)
    end
end

return Chart