local x, y = 0, 0
local speed = 500

function love.update(dt)
    if love.keyboard.isDown("right") then x = x + speed * dt end
    if love.keyboard.isDown("left")  then x = x - speed * dt end
    if love.keyboard.isDown("down")  then y = y + speed * dt end
    if love.keyboard.isDown("up")    then y = y - speed * dt end
end

function love.draw()
    love.graphics.rectangle("fill", x, y, 50, 50)
    love.graphics.print("RapperProject", 10, 10)
end