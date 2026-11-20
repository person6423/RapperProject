local Rapper = {}

function Rapper.draw()
    love.graphics.draw(ImagesRapperIcons, PlayerPosX, ChartYPosition)
end

function Rapper.update(dt)
    PlayerPosX = PlayerPosX + 5
    if PlayerPosX > ChartXPosition + ChartIconSize * ChartLength then
        PlayerPosX = ChartXPosition
        ChartBar = ChartBar + 1
        if ChartBar > 5 then
            ChartBar = 0
        end
    end
end

return Rapper