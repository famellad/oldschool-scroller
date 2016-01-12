Class = require 'libs.hump.class'

Powerup = Class{}

-- Prototype powerup class
function Powerup:init(x, y)
  self.x = x
  self.y = y

  self.radius = 6
  self.vy = 1

  self.img = nil
end

function Powerup:update(dt)
  self.y = self.y + self.vy * dt
end

function Powerup:effect(player)
  self.y = 1000
end

function Powerup:draw()
  if debug >= 2 then
    love.graphics.setColor(40, 255, 20, 255)
    love.graphics.circle("line", self.x, self.y, self.radius, 16)
    love.graphics.setColor(255, 255, 255, 255)
  end
end
