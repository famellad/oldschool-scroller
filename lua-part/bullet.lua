-- bullet table, all bullets
--bullets = {}
bulletImgs = {}

-- Load ALL the models for the bullets
-- TODO THIS SHOULD BE DONE IN EACH INDIVIDUAL BULLET CLASS
-- TODO MAYBE IT WORKS BETTER THIS WAY BECAUSE OF BULLET LEVELS
function bulletImgs.load()
  bulletImgs.hammer0Img = love.graphics.newImage('gfx/pews/hammer0.png')
  bulletImgs.hammer1Img = love.graphics.newImage('gfx/pews/hammer1.png')
  bulletImgs.hammer2Img = love.graphics.newImage('gfx/pews/hammer2.png')

  bulletImgs.spread0Img = love.graphics.newImage('gfx/pews/spread0.png')
  -- spread1
  -- spread2

  bulletImgs.gauss0Img = love.graphics.newImage('gfx/pews/gauss0.png')
  bulletImgs.gauss1Img = love.graphics.newImage('gfx/pews/gauss1.png')
  bulletImgs.gauss2Img = love.graphics.newImage('gfx/pews/gauss2.png')

  bulletImgs.machineImg = love.graphics.newImage('gfx/pews/machine.png')
end

Class = require 'libs.hump.class'

Bullet = Class{}

function Bullet:init(x, y, level, goUp)
  -- Positions and speed
  self.x = x
  self.y = y
  self.vx = 0
  self.vy = 1

  -- Dimensions
  self.w = 1
  self.h = 1

  -- Damage!
  self.level = level
  self.dam = 0

  -- Bullet model
  self.img = nil

  -- Whether the bullet is going up or not
  self.goUp = goUp
  self:flip()
end

function Bullet:flip()
  -- Invert the vertical velocity of the bullet
  if self.goUp then
    self.vy = -1 * self.vy
  end
end

function Bullet:update(dt)
  -- Move it
  self.y = self.y + self.vy * dt
  self.x = self.x + self.vx * dt
end

function Bullet:draw()
  -- Draw particle from center rather than origin
  -- (Lines up with point-circle collission detection)
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  -- Rotate the bullet depending on orientation
  if self.goUp then
    love.graphics.draw(self.img, nx, ny)
  else
    love.graphics.draw(self.img, nx + self.w, ny + self.h, 3.141592)
  end

  -- Draw debug information
  if debug >= 2 then
    love.graphics.setColor(255, 200, 0, 255)
    love.graphics.circle("line", self.x, self.y, 2, 8)
    love.graphics.setColor(255, 255, 255, 255)
  end
end
