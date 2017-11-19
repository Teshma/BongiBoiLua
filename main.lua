function love.load()
    require "entities"
    require "bodies"
    require "player"
    backgroundimage = love.graphics.newImage("assets/Level.jpg")
    player:setX(130)
    player:setY(550)
end

function love.draw(dt)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(backgroundimage, 0, 0, 0, 2, 2)
    player:draw()
    player:drawhealth()
end

function love.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    player:update(dt)
end
