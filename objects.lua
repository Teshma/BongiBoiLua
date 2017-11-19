require "player"
objects =
{
    bool = false,
    platforms =
    {
        platform1 =
        {
            x = 150, y = 650, w = 150, h = 20
        }
    }
}

function drawPlatforms(x, y, w, h) -- function to draw the map walls
  love.graphics.setColor(50, 50, 200, 255)
  love.graphics.rectangle("fill", x, y, w, h)
end

function objects:draw() -- map draw function that is called in the main.lua file
    --local objx, objw, objy = objects:underBody(player)
    local x, y = player:getPos()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    --love.graphics.setColor(255, 255, 255, 255)
    --love.graphics.print(objx .. " " .. objw .. " " .. objy .. " " .. x .. " " .. y, x - width/2 + 5, y - height/2 + 50)
  local i,v
  for i,v in pairs(objects.platforms) do
    drawPlatforms(v.x, v.y, v.w, v.h)
  end
end

function objects:underBody(body)
    local x,y = player:getPos()
    local i,v
    for i,v in pairs(objects.platforms) do
        if x > v.x and x < (v.x + v.w) and y <= v.y then
            -- --self.bool = true
            -- return v.x, v.w, v.y
            player:stopfalling(v.y)
        end
    end
end

function objects:update(dt)
    -- local objx, objw, objy
    objects:underBody(player)
    local x,y = player:getPos()
    -- if self.bool then
    --     player:falling(objx, objw, objy, dt)
    -- else
    --     player:stopfalling(objy)
    -- end
end
