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
  self.vx = math.random(-22, 22)
  self.vy = math.random(50, 70)
  self.vr = (math.random(7, 17)) / 5
  self.dif = 35

  if math.random(0, 1) == 1 then
    self.vr = self.vr * -1
  end

  self.w = 16
  self.h = 16

  self.img = love.graphics.newImage('gfx/sprites/asteroid-small.png')

  --local period = (math.random(1, 10)) / 10

  --self.anim = newAnimation(self.img, self.w, self.h, period, 12)
end

function AsteroidSmall:doAI(dt)
  --self.anim:update(dt)
  self.r = self.r + self.vr * dt
end

function AsteroidSmall:draw()
  -- love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y))
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  --self.anim:draw(self.x, self.y, self.r, 1, 1, self.w / 2, self.h / 2)
  love.graphics.draw(self.img, self.x, self.y, math.floor(self.r * 6) * 6, 1, 1, self.w / 2, self.h / 2)
  Enemy.draw(self)
  --love.graphics.print("vr: " .. self.vr, self.x, self.y)
end

function AsteroidSmall:destroy()
  ExplosionMed(self.x, self.y)
  game.gs:addScore(1)
  Enemy.destroy(self, false)
end
