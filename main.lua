function love.load()
    require "entities"
    require "bodies"
    require "player"
    player:setX(130)
    player:setY(700)
end

function love.draw(dt)
    player:draw()
    player:drawhealth()
end

function love.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    player:update(dt)
end
