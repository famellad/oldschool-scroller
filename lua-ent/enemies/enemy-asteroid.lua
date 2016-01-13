Class = require 'libs.hump.class'

-- All enemies must inherit from Enemy
AsteroidMedium = Class{__includes = Enemy}

-- Works the exact same way as AsteroidSmall, sans the destruction
function AsteroidMedium:init(x, y)
  self.x = x
  self.y = y
  self.r = math.random(0, 10)
  self.radius = 15
  self.mhp = 35
  self.hp = self.mhp
  self.sp = 0
  self.vx = math.random(-8, 8)
  self.vy = math.random(60, 80)
  self.vr = (math.random(10, 20)) / 5
  self.dif = 50

  if math.random(0, 1) == 1 then
    self.vr = self.vr * -1
  end

  self.w = 36
  self.h = 36

  self.img = love.graphics.newImage('gfx/sprites/asteroid.png')

  self.anim = newAnimation(self.img, self.w, self.h, period, 12)
end

function AsteroidMedium:doAI(dt)
  self.r = self.r + self.vr * dt
end

function AsteroidMedium:draw()
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  self.anim:draw(self.x, self.y, math.floor(self.r * 6) / 6, 1, 1, self.w / 2, self.h / 2)

  Enemy.draw(self)
end

function AsteroidMedium:destroy()
  ExplosionMed(self.x, self.y)
  game.gs:addScore(1)
  -- At death time, three small asteroids are created and added to the enemy list
  for i=1,3 do
    local newAsteroid = AsteroidSmall(self.x + math.random(self.radius) - self.radius/2, self.y + math.random(self.radius) - self.radius/2)
    table.insert(game.gs.dir.enemies, newAsteroid)
  end
  Enemy.destroy(self, true)
end
