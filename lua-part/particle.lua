require 'libs.hump.class'

Particle = Class{}

function Particle:init(x, y)
  self.x = x
  self.y = y
  self.age = 0
  self.maxAge = 10

  --self.img = love.graphics.newImage("gfx/parts/particles/grey-pixel.png")
  self.img = love.graphics.newImage('gfx/nul.png')
end

function Particle:update(dt)
  self.age = self.age + 1 * dt
end

function Particle:draw()
  love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y))
end
