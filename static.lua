-- Width and height are defined as global variables for ease of use
-- realWidth is screen width, width is the game width
height = 224
width = 170
realWidth = 256

-- This function returns the distance squared between two points!
function d2(x1, y1, x2, y2)
  return (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)
end

-- Collision detection taken function from http://love2d.org/wiki/BoundingBox.lua
-- Returns true if two boxes overlap, false if they don't
function BoxBoxCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function PointCircleCollision(x, y, r, px, py)
  -- OPTIMISE THIS TO HELL!!!!!!
  return d2(x, y, px, py) < r*r
end

function CircleCircleCollision(x1, y1, r1, x2, y2, r2)
  return d2(x1, y1, x2, y2) < (r1+r2)*(r1+r2)
end

-- Returns consistent alpha levels, quantized (8-bits)
-- A real SNES has only 3 alpha levels 0, 127 and 255
function AlphaLevel (current, maximum)
  if current < maximum * 2 / 100 then
    return 0
  elseif current <= maximum / 7 then
    return 18
  elseif current <= maximum * 2 / 7 then
    return 61
  elseif current <= maximum * 3 / 7 then
    return 102
  elseif current <= maximum * 4 / 7 then
    return 145
  elseif current <= maximum * 5 / 7 then
    return 186
  elseif current <= maximum * 6 / 7 then
    return 230
  else
    return 255
  end
end

-- Returns the length of a table object
function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
