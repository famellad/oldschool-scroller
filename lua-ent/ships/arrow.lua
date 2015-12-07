Class = require 'libs.hump.class'

ShipArrow = Class{__includes = Ship}

function ShipArrow:init()
  self.radius = 11  -- Radius for collisions
  self.maxv = 140    -- Maximum velocity
  self.acc = 700     -- Acceleration
  self.mhp = 30     -- Maximum HP
  self.msp = 25     -- Maximum SP
  self.mpp = 360     -- Maximum PP

  self.img = love.graphics.newImage('gfx/sprites/pship-arrow.png')   -- Ship model
  --self.exhaust = EmitterExhaust(-1, 10, 6, 0.2)
  self.exhaust = newAnimation(love.graphics.newImage('gfx/parts/exhaust.png'), 5, 5, 0.1, 0)
end

function ShipArrow:update(dt, x, y, vx, vy)
  -- love.window.setTitle("cosa")
  --self.exhaust:update(dt, x, y, vx, vy)
  Ship.update(self)
  self.exhaust:update(dt)
end

function ShipArrow:draw(x, y)
  --self.exhaust:draw()
  Ship.draw(self, x, y)
  self.exhaust:draw(x + 9, y + 20)
end
