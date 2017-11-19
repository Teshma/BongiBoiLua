require "world"
-- player file
player = bodies:new{    --initialisation of the player class
  name = "Bongi Boi",
  health = 500,
  maxHealth = 500,
  velocity = 250,
  height = 50,
  width = 50,
  life = true,
  input = true,
  xvelocity = 500,
  yvelocity = 0,
  wasFacing = "right",
  jumpheight = -500,
  standing = true,
  imgR = love.graphics.newImage("assets/idle/idleR.png"),
  imgL = love.graphics.newImage("assets/idle/idleL.png"),
  imgRunR1 = love.graphics.newImage("assets/running/running2.png"),
  imgRunL1 = love.graphics.newImage("assets/running/running4.png"),
  imgJump = love.graphics.newImage("assets/jump/jump.png")
}

function player:imgUpdate()
    if self.state == "right" then
        self.img = self.imgRunR1
    end
    if self.state == "left" then
        self.img = self.imgRunL1
    end
    if self.state == "up" then
        self.img = self.imgJump
    end
    if self.state == "still" then
        if self.wasFacing == "right" then
            self.img = self.imgR
        end
        if self.wasFacing == "left" then
            self.img = self.imgL
        end
    end
end

function player:move(dt)
    local x, y = self:getPos()
    local v = self:getVelocity()
    local down = love.keyboard.isDown
    if self.input == true then
        if down("d") and self.canwalk.right == true then
            self.state = "right"
            self.wasFacing = "right"
            local deltaX = x + v*dt
            self:setX(deltaX)
        else
            self.state = "still"
        end
        if down("a") and self.canwalk.left == true then
            self.state = "left"
            self.wasFacing = "left"
            local deltaX = x - v*dt
            self:setX(deltaX)
        end
        if down("space") and self.canwalk.up == true then
            if self.yvelocity == 0 then
                self.yvelocity = self.jumpheight
            end
        end
        if self.yvelocity ~= 0 then
            self.state = "up"
            local deltaY = y + self.yvelocity *dt
            self:setY(deltaY)
            self.yvelocity = self.yvelocity - self.gravity *dt
        end
        player:stopfalling(world.ground.y)
    end
end

function player:stopfalling(platform_y)
    local x,y = self:getPos()
    if y > platform_y then
        self.yvelocity = 0
        self:setY(platform_y)
    end
end

function player:falling(objectx, objectw, objecty, dt)
    local x,y = self:getPos()
    if x > objectx + objectw and y > objecty then
        standing = false
        self:fall(dt)
    end
end

function player:fall(dt)
    self.yvelocity = self.gravity
    local deltaY = self.getY() - self.yvelocity * dt
    self:setY(deltaY)
    self.yvelocity = self.yvelocity - self.gravity * dt
end

function player:camera() -- control the player camera
  local x,y = self:getPos()
  camera:setPosition(x - love.graphics.getWidth() / 2, y - love.graphics.getHeight() / 2) -- set player camera position to top left of screen
end

function player:drawhealth() -- draw player health
  local health = math.ceil(self:getHealth())
  local maxhealth = self:getmaxHealth()
  local healthratio = (health*10/maxhealth)/10
  local name = self:getName()
  local width = love.graphics.getWidth()
  local height = love.graphics.getHeight()
  local x, y = self:getPos()
  if healthratio <= 0 then
    healthratio = 0
  end

  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.print("Player: " .. name .. "  HP: ".. health, x - width/2 + 5, y - height/2 + 10)

  love.graphics.setColor(50, 50, 50, 255)
  love.graphics.rectangle("fill", x - width/2 + 1, y - height/2 + 38, 204, 14)

  love.graphics.setColor(255*(1-healthratio),200*healthratio, 50, 255)
  love.graphics.rectangle("fill", x - width/2 + 3, y - height/2 + 40, 200*healthratio, 10)
end

function player:update(dt)
    self:camera()
    self:move(dt)
    self:imgUpdate()
end
