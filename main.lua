local buttonsImg

local scale = 3
local ChartXPosition, ChartYPosition

local function setChartPosition()
    ChartXPosition = (1280 - (16 * scale * 18)) / 2
    ChartYPosition = 30
end

local function sliceSheet(image, fw, fh)
    local quads = {}
    for y = 0, image:getHeight() - fh, fh do
        for x = 0, image:getWidth() - fw, fw do
            table.insert(quads, love.graphics.newQuad(x, y, fw, fh, image:getDimensions()))
        end
    end
    return quads
end

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    buttonsImg = love.graphics.newImage("assets/chartIcons.png")

    setChartPosition()
end

function love.draw()
    local buttonsImgSliced = sliceSheet(buttonsImg, 16, 16)

    for i = 0, 17 do
        local ClipToUse = buttonsImgSliced[7]
        if (i - 2) % 4 == 0 then
            ClipToUse = buttonsImgSliced[8]
        end
        love.graphics.draw(buttonsImg, ClipToUse, ChartXPosition + i * 16 * scale, ChartYPosition, 0, scale, scale)
    end

    for i = 0, 5 do
        love.graphics.draw(buttonsImg, buttonsImgSliced[i + 1], ChartXPosition + (i * 3) * 16 * scale, ChartYPosition, 0, scale, scale)
    end
end