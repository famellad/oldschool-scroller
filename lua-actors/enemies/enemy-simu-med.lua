Class = require 'libs.hump.class'

-- All enemies must inherit from Enemy
EnemySimuMed = Class{__includes = Enemy}

-- This is the medium sized enemy that appears only during the simulation level
function EnemySimuMed:init(x, sineTimer)
  self.x = x
  self.cx = x
  self.y = -30
  self.radius = 13
  self.mhp = 40
  self.msp = 0
  self.hp = self.mhp
  self.sp = self.msp
  self.vx = 0
  self.vy = 55
  self.dif = 80

  -- Sine timer for the movement
  self.sineTimer = sineTimer

  -- Shooting timer
  self.shootTimerMax = 2.0
  self.shootTimer = self.shootTimerMax
  self.canShoot = false

  self.img = love.graphics.newImage('gfx/sprites/enemy-simu-med.png')
  --self.shieldImg = love.graphics.newImage('gfx/sprites/bad-shield.png')

  self.w = self.img:getWidth()
  self.h = self.img:getHeight()

  --self.shieldAnim = newAnimation(self.shieldImg, 29, 18, 1, 2)
end

function EnemySimuMed:update(dt)
  Enemy.update(self, dt)

  self.shootTimer = self.shootTimer - 1*dt
  if self.shootTimer < 0 then
    self.canShoot = true
  end
end

function EnemySimuMed:doAI(dt)
  -- Move in a funky wave
  self.sineTimer = self.sineTimer + (dt * 1)

  self.x = self.cx + 8 * math.sin(1.5*self.sineTimer)
  if self.cx < game.gs.player.x then
    self.cx = self.cx + 6 * dt
  else
    self.cx = self.cx - 6 * dt
  end


  if self.sp < self.msp then
    self.sp = self.sp + (2 * dt)
  end

  -- Check whether to shoot
  local dist = game.gs.player.y - self.y
  if self.canShoot
  and math.abs(game.gs.player.x - self.x) < width / 8
  and dist < height * 2/3 and dist > 0 then
    self:shoot()
  end
end

function EnemySimuMed:shoot()
  self.canShoot = false
  self.shootTimer = self.shootTimerMax

  -- Actually shoot
  newBullet1 = BulletHammer(self.x + self.w / 2, self.y + 10, 0, false)
  newBullet2 = BulletHammer(self.x - self.w / 2, self.y + 10, 0, false)
  game.gs.badBullets:addBullet(newBullet1)
  game.gs.badBullets:addBullet(newBullet2)
end

function EnemySimuMed:draw()
  love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, self.w / 2, self.h / 2)

  --love.graphics.setColor(255, 255, 255, AlphaLevel(self.sp, self.msp))
  --self.shieldAnim:draw(self.x - 1, self.y - 1, 0, 1, 1, self.w / 2, self.h / 2)
  --love.graphics.setColor(255, 255, 255, 255)

  Enemy.draw(self)
end

function EnemySimuMed:destroy()
  ExplosionMed(self.x, self.y)
  Enemy.destroy(self, true)
  game.gs:addScore(1)
end
