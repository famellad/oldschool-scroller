Class = require 'libs.hump.class'

-- All enemies must inherit from Enemy
AsteroidSmall = Class{__includes = Enemy}

function AsteroidSmall:init(x, y)
  self.x = x
  self.y = y
  self.r = math.random(0, 10)
  self.radius = 8
  self.mhp = 12
  self.hp = 6
  self.sp = 0
  self.vx = math.random(-22, 22)     -- Velocities are random
  self.vy = math.random(50, 70)
  self.vr = (math.random(7, 17)) / 5 -- Same as rotation
  self.dif = 35

  -- Chance of flipping the direction of rotation
  if math.random(0, 1) == 1 then
    self.vr = self.vr * -1
  end

  self.w = 16
  self.h = 16

  self.img = love.graphics.newImage('gfx/sprites/asteroid-small.png')
end

function AsteroidSmall:doAI(dt)
  -- All the AI does is rotate the thing
  self.r = self.r + self.vr * dt
end

function AsteroidSmall:draw()
  -- calculate the middle point (and don't use it)
  --local nx = math.floor(self.x - self.w / 2)
  --local ny = math.floor(self.y - self.h / 2)

  -- Draw the thing
  love.graphics.draw(self.img, self.x, self.y, math.floor(self.r * 6) * 6, 1, 1, self.w / 2, self.h / 2)
  Enemy.draw(self)
end

function AsteroidSmall:destroy()
  -- Spawn a medium sized explosion
  -- TODO THIS SHOULD BE SMALL
  ExplosionMed(self.x, self.y)
  -- We add one point because I don't know how games work TODO
  game.gs:addScore(1)
  -- The asteroid is finally destroyed
  Enemy.destroy(self, false)
end
