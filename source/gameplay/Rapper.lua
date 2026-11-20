local Rapper = {}

PlayerPosX = 0

function Rapper.draw()
    love.graphics.draw(ImagesRapperIcons, PlayerPosX, ChartYPosition, 0, ChartScale, ChartScale)
end

function Rapper.update(dt)
    PlayerPosX = PlayerPosX + 5
    if PlayerPosX > 1280 then
        PlayerPosX = 0
    end
end

return Rapper