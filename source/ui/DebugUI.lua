local Music = require "source.gameplay.Music"

local padding = 10
local textHeight = 15

local DebugUI = {}

function DebugUI.draw()
    local textToDraw = {
        "Max FPS: " .. TargetFPS,
        "FPS: " .. love.timer.getFPS(),
        "",
        "BPM: " .. Music.bpm,
        "Song Time: " .. Music.songTime,
        "Beat: " .. Music.currentBeat,
        "",
        "Chart Bar: " .. ChartBar,
        "",
        "StageID: " .. StageID
    }

    local longestWidth = 0
    for _, i in pairs(textToDraw) do
        longestWidth = math.max(longestWidth, love.graphics.getFont():getWidth(i))
    end

    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle("fill", 0, 0, longestWidth + padding * 2, (padding * 2) + #textToDraw * textHeight)
    love.graphics.setColor(1, 1, 1, 1)

    for _, i in pairs(textToDraw) do
        love.graphics.print(i, padding, padding + (_ - 1) * textHeight)
    end
end

return DebugUI