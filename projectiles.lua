require "player"
require "scripts"
projectile = {
    img = love.graphics.newImage("assets/Projectiles/attackProjectile1.png"),
    bells = {}
}

function projectile:gen(xpos, ypos, xv)
    table.insert(projectile.bells, {
        x = xpos,
        y = ypos,
        w = 50,
        h = 50,
        xvelocity = xv,
        damage = 100,
        life = true
    })
end

function projectile:draw()
    local i,v
    for i,v in pairs(projectile.bells) do

        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(self.img, v.x, v.y, 0, 0.3, 0.3)
    end
end

function projectile:update(dt)
    local i,v
    for i,v in pairs(projectile.bells) do
        v.x = v.x +v.xvelocity*dt
    end


end
