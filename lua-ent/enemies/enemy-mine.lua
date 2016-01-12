Class = require 'libs.hump.class'

-- All enemies must inherit from Enemy
EnemyMine = Class{__includes = Enemy}

function EnemyMine:init(x, y)
  self.x = x
  self.y = -30 - y
  self.radius = 5
  self.mhp = 50
  self.hp = 10 -- Do this so they are devastating yet weak
  self.sp = 0
  self.vx = 0
  self.vy = 50
  self.dif = 70

  self.engaged = false -- Has the mine already engaged the player?

  self.w = 10
  self.h = 10

  self.img = love.graphics.newImage('gfx/sprites/mine.png')
  self.anim = newAnimation(self.img, 10, 10, 1, 3)
end

function EnemyMine:doAI(dt)
  -- self.anim:update(dt)
  if game.gs.isAlive then
    local gpx = game.gs.player.x
    local gpy = game.gs.player.y
    local d2 = d2(self.x, self.y, gpx, gpy)

    local v = 12

    if  d2 < 5500 then
      self.anim:seek(2)
      -- Find less expensive way to do this
      local dx = math.abs(self.x - gpx)
      local dy = math.abs(self.y - gpy)
      --local th = math.atan2(dy, dx)
      --local cost = math.cos(th) / d
      --local sint = math.sin(th) / d

      self.engaged = true

      self:reachVelocity(5, dt)

      if self.x > gpx then
        self.x = self.x - v * dx / d2
      else
        self.x = self.x + v * dx / d2
      end
      if self.y > gpy then
        self.y = self.y - v * dy / d2
      else
        self.y = self.y + v * dy / d2
      end
    else
      if self.engaged then
        self.anim:seek(3)
        self:reachVelocity(2, dt)
      end
    end
  end
end

function EnemyMine:reachVelocity(target, dt)
  if self.vy > target then
    self.vy = self.vy - 4*dt
  elseif self.vy < target then
    self.vy = self.vy + 4*dt
  end
end

function EnemyMine:draw()
  -- love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y))
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  self.anim:draw(nx, ny)
  --love.graphics.draw(self.img, nx, ny)

  Enemy.draw(self)
end

function EnemyMine:destroy()
  ExplosionMed(self.x, self.y)
  game.gs:addScore(1)
  Enemy.destroy(self, true)
end
