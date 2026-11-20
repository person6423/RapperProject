local Rapper = {}

PlayerPosX = ChartXPosition - ChartIconSize

function Rapper.draw()
    love.graphics.draw(ImagesRapperIcons, PlayerPosX, ChartYPosition)
end

function Rapper.update(dt)
    PlayerPosX = PlayerPosX + 5
    if PlayerPosX > ChartXPosition + ChartIconSize * ChartLength then
        PlayerPosX = ChartXPosition
    end
end

return Rapper