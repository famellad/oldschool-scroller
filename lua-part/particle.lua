require 'libs.hump.class'

Particle = Class{}

-- Prototypical particle class
function Particle:init(x, y)
  self.x = x
  self.y = y
  self.age = 0     -- Current age of the particle
  self.maxAge = 10 -- Maximum age, after particles reach a max age, they are removed

  -- Nul graphics for nul particles
  self.img = love.graphics.newImage('gfx/nul.png')
end

function Particle:update(dt)
  -- Increase the age on every update
  self.age = self.age + 1 * dt
end

function Particle:draw()
  -- Draw the particle
  love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y))
end
