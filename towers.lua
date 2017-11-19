require "projectiles"
towers = bodies:new{
    img = love.graphics.newImage("assets/Enemy/enemyL.png"),
    bodies = {}
}

function towers:gen(xpos, ypos)
    table.insert(self.bodies, {
        x = xpos,
        y = ypos,
        w = 300,
        h = 300,
        health = 100,
        xvelocity = 500,
        yvelocity = 0,
        jumpheight = -500,
        gravity = -500,
        life = true,
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
    towers:collide()
end
function towers:collide()
    local i,v
    for i,v in ipairs(self.bodies) do
        local k,p
        for k,p in pairs(projectile.bells) do
            if checkCollision(p.x+p.w, p.y+p.h, p.w, p.h, v.x, v.y+(v.h/2), v.w, v.h) then
                v.life = false
                p.life = false
                print(table.getn(p))
                print(table.getn(v))
                table.remove(v, i)
                table.remove(projectile.bells, k)
            end
        end
    end
end

function towers:draw()
        local i,v
        for i,v in pairs(towers.bodies) do
            if v.life then
                love.graphics.setColor(255,255,255,255)
                love.graphics.draw(self.img, v.x, v.y, 0.6, 0.6)
        end
    end
end
