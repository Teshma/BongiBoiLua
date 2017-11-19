-- scripts file
require "camera"
-- function checks a collision between two rectangles
function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
-- function checks if a random number is below a rarity (it is used for generating item drops on enemy death)
function randomGen(min, max, rarity)
 local rng = love.math.newRandomGenerator(os.time())
 local randomNumber = rng:random(min, max)
  if randomNumber <= rarity then
    return true
  else
    return false
  end
end

-- adds x and y onto the camera position which is in the top left of the screen, it is used to translate mouse co-ordinates to world co-ordinates
function toWorldCoords(x,y)
    x = x + (camera._x)
    y = y + (camera._y)
    return x,y
end
-- checks if a point is inside a rectangle
function insideBox( px, py, x, y, w, h )
	if px > x and px < x + w then
		if py > y and py < y + h then
			return true
		end
	end
	return false
end
