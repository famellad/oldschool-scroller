Class = require 'libs.hump.class'

Player = Class{}

function Player:init()
  -- Init variables
  -- > Ship
    self.ship = ShipArrow()
  -- > Movement
    self.x = width/2
    self.y = 300
    self.vx = 0
    self.vy = 0
    self.ax = 0
    self.ax = 0
  -- > controls
    self.movingLeft = false
    self.movingRight = false
    self.movingUp = false
    self.movingDown = false
    --self.moving = false
  -- > Gameplay
    self.hp = self.ship.mhp
    self.sp = self.ship.msp
    self.pp = self.ship.mpp
  -- > Loadout
    self.weapons = {}

  -- > Size
    self.w = self.ship.img:getWidth()
    self.h = self.ship.img:getHeight()
end

function Player:triggerWeapon(mount)
  if self.pp > 0 and game.gs.isAlive then
    if mount == "all" then
      local totalPP = 0
      for i, weapon in ipairs(self.weapons) do
        totalPP = totalPP + weapon.energy
      end
      local currPP = self.pp
      for i, weapon in ipairs(self.weapons) do
        if weapon.canShoot and currPP >= totalPP then
          weapon:shoot(self)
        end
      end
    elseif mount == "front" then
      if self.weapons[1].canShoot then
        self.weapons[1]:shoot(self)
      end
    elseif mount == "left" then
      if self.weapons[2].canShoot then
        self.weapons[2]:shoot(self)
      end
    elseif mount == "right" then
      if self.weapons[3].canShoot then
        self.weapons[3]:shoot(self)
      end
    end
  end
end

function Player:update (dt)
  -- Refill battery
  if self.pp < self.ship.mpp then
    self.pp = self.pp + 22 * dt
  end

  -- Refill shield
  if self.sp < self.ship.msp then
    self.sp = self.sp + 3 * dt
  end

  self:handleMovement(dt)
  self:handleMovementPost(dt)
  self:brake(dt)

  -- Update weapons
  for i, weapon in ipairs(self.weapons) do
    weapon:update(dt)
  end

  -- Update Ship
  self.ship:update(dt, self.x, self.y, self.vx, self.vy)
end

function Player:damage(damage)
  -- 90% of the damage is absorbed by the shield
  self.sp = self.sp - (9 * damage / 10)

  -- If this happens to destroy the shield... (making it a negative value)
  if self.sp < 0 then
    -- The remaining damage should be substracted to the hp
    self.hp = self.hp + self.sp
    -- The shield is then set to 0
    self.sp = 0
  end

  -- The remaining 10% of the damage is then passed to the hp
  self.hp = self.hp - (damage / 10)

  -- If the hp of a ship drops below 0, it must be destroyed
  if self.hp <= 0 then
    self:destroy()
  end
end

function Player:destroy()
  game.gs.isAlive = false
  ExplosionMed(self.x, self.y)
  music.tracks.feathers:stop()
  TEsound.play("bgm/death-noloop.ogg", "dead")
end

function Player:reset ()
  self.x = width/2
  self.y = 300
  self.hp = self.ship.mhp
  self.sp = self.ship.msp
  self.pp = self.ship.mpp
end

function Player:draw ()
  if game.gs.isAlive then
    local nx = math.floor(self.x - self.w / 2)
    local ny = math.floor(self.y - self.h / 2)
    self.ship:draw(nx, ny)

    if debug >= 2 then
      love.graphics.setColor(150, 170, 255, 255)
      love.graphics.circle("line", self.x, self.y, self.ship.radius, 16)
      love.graphics.setColor(255, 255, 255, 255)
    end

  end
end
