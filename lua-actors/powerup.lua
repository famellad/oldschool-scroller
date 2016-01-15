Class = require 'libs.hump.class'

Powerup = Class{}

-- Prototype powerup class
function Powerup:init(x, y)
  -- On creation coordinates are passed
  self.x = x
  self.y = y

  -- Size and speed are generic
  self.radius = 6
  self.vy = 1

  -- Assign a null image
  self.img = nil
end

function Powerup:update(dt)
  -- Move down...
  self.y = self.y + self.vy * dt
end

function Powerup:effect(player)
-- On effect, move out of bounds for the main loop to remove it
  self.y = 1000
end

function Powerup:draw()
  if debug >= 2 then
    -- Draw bounding box in green if debug is active
    love.graphics.setColor(40, 255, 20, 255)
    love.graphics.circle("line", self.x, self.y, self.radius, 16)
    love.graphics.setColor(255, 255, 255, 255)
  end
end
