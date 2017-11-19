require "player"
projectile = {
    img = love.graphics.newImage("assets/Projectiles/attackProjectile1.png"),
    bells = {}
}

function projectile:gen(xpos, ypos, xv)
    table.insert(projectile.bells, {
        x = xpos,
        y = ypos,
        xvelocity = xv
    })
end

function projectile:draw()
    local i,v
    for i,v in pairs(projectile.bells) do
        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(self.img, v.x, v.y, 0, 0.5, 0.5)
    end
end

function projectile:update(dt)
    local i,v
    for i,v in pairs(projectile.bells) do
        v.x = v.x +v.xvelocity*dt
    end
end
