entities = {
    name = nil,
    id = 0,
    xPos = nil,
    yPos = nil,
    width = nil,
    height = nil,
    velocity = nil,
    state = "still",
    xOffset = nil,
    yOffset = nil,
    img = nil
}

function entities:new(o) -- function to create classes to inherit entities functions
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function entities:getName()
  return self.name
end

function entities:getPos()
  return self.xposition, self.yposition
end

function entities:getX()
  return self.xposition
end

function entities:getY()
  return self.yposition
end

function entities:getDimensions()
  return self.width, self.height
end

function entities:getWidth()
  return self.width
end

function entities:getHeight()
  return self.height
end

function entities:getOffset()
  return self.xoffset, self.yoffset
end

function entities:setImg(filepath)
  self.img = love.graphics.newImage(filepath)
end

function entities:getImg()
    return self.img
end

function entities:getVelocity()
    return self.velocity
end

function entities:setName(name)
  self.name = name
  return self.name
end

function entities:setWidth(width)
  self.width = width
  return self.width
end

function entities:setHeight(height)
  self.height = height
  return self.height
end

function entities:setX(value)
  self.xposition = value
  return self.xposition
end

function entities:setY(value)
  self.yposition = value
  return self.yposition
end

function entities:getID()
  return self.id
end

function entities:setID()
  local count = count or 0
  self.id = count
  count = count + 1
  return self.id
end

function entities:draw()              -- draw function to draw the entity
  local x, y = self:getPos()
  local w, h = self:getDimensions()
  local xoffset, yoffset = self:getOffset()
  local img = self:getImg()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(img, x, y, 0, 0.05, 0.05, xoffset, yoffset) -- draw the entity
end
