function love.load()
    require "entities"
    require "bodies"
    require "player"
    require "camera"
    require "objects"
    require "towers"
    bg_image = love.graphics.newImage("assets/Level.jpg")
    bg_image:setWrap("repeat", "repeat")
    bg_quad = love.graphics.newQuad(0, 0, 200000, 2000, bg_image:getWidth(), bg_image:getHeight())

    player:setX(5000)
    player:setY(550)
    towers:gen(5300, 550, 50)
end

function love.draw(dt)
    camera:set()
    love.graphics.setColor(255, 255, 255, 255)
    --love.graphics.draw(backgroundimage, 0, 0, 0, 2, 2)
    love.graphics.draw(bg_image, bg_quad, 0, 0, 0, 2, 2)
    player:draw()
    player:drawhealth()
    towers:draw()
    --objects:draw()
    camera:unset()
end

function love.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    player:update(dt)
    towers:jump(dt)
    --objects:update(dt)
end
