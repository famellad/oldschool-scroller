Class = require 'libs.hump.class'

ShipArrow = Class{__includes = Ship}

-- The only ship that's worth it sprite-wise...
-- This is the ship the player uses
function ShipArrow:init()
  self.radius = 11  -- Radius for collisions
  self.maxv = 140    -- Maximum velocity
  self.acc = 700     -- Acceleration
  self.mhp = 30     -- Maximum HP
  self.msp = 25     -- Maximum SP
  self.mpp = 360     -- Maximum PP

  self.img = love.graphics.newImage('gfx/sprites/pship-arrow.png')   -- Ship model
  self.frames = newAnimation(self.img, 23, 23, 0.1, 0)
  --self.exhaust = EmitterExhaust(-1, 10, 6, 0.2)
  self.exhaust = newAnimation(love.graphics.newImage('gfx/parts/exhaust.png'), 5, 5, 0.1, 0)
end

function ShipArrow:update(dt, x, y, vx, vy)
  --self.exhaust:update(dt, x, y, vx, vy)
  Ship.update(self)

  if (vx < -80) then
    -- If the ship is moving left faster than 80 units/sec, use the turn left frame
    self.frames:seek(2)
  elseif (vx > 80) then
    -- Likewise, if it's moving to the right faster than 80 units/sec, use the turn right frame
    self.frames:seek(3)
  else
    -- Else, use the regular standing frame
    self.frames:seek(1)
  end

  self.exhaust:update(dt)
end

function ShipArrow:draw(x, y)
  -- TODO DRAW THE SHADOW IF NECESSARY
  love.graphics.setColor(0, 0, 0, 127)
    self.frames:draw(x + 45, y + 24, 0, 0.51, 0.51)
  love.graphics.setColor(255, 255, 255, 255)
  self.frames:draw(x + 23, y)           -- Draw the model
  self.exhaust:draw(x + 9 + 23, y + 20) -- Draw the exhaust
end
