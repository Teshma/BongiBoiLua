towers = bodies:new{
    img = love.graphics.newImage("assets/Enemy/enemyL.png"),
    bodies = {}
}

function towers:gen(xpos, ypos, healthval)
    table.insert(self.bodies, {
        x = xpos,
        y = ypos,
        health = healthval,
        xvelocity = 500,
        yvelocity = 0,
        jumpheight = -500,
        gravity = -500
    })
end

function towers:jump(dt)
    local i,v
    for i,v in pairs(towers.bodies) do
        if v.yvelocity == 0 then
            v.yvelocity = v.jumpheight
        end
        if v.yvelocity ~= 0 then
            v.y = v.y + v.yvelocity * dt
            v.yvelocity = v.yvelocity - v.gravity * dt
        end
        v.x = v.x - v.xvelocity * dt
        if v.y > world.ground.y then
            v.yvelocity = 0
            v.y = world.ground.y
        end
    end
end

function towers:draw()
    local i,v
    for i,v in pairs(towers.bodies) do
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(self.img, v.x, v.y, 0.3, 0.3)
    end
end
