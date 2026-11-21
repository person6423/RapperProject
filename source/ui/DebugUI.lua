local DebugUI = {}

function DebugUI.draw()
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
end

return DebugUI