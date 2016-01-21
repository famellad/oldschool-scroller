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
    self.ay = 0
  -- > controls
    self.movingLeft = false
    self.movingRight = false
    self.movingUp = false
    self.movingDown = false
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

function Player:update (dt)
  -- Refill battery
  if self.pp < self.ship.mpp then
    self.pp = self.pp + 22 * dt
  end

  -- Refill shield
  if self.sp < self.ship.msp then
    self.sp = self.sp + 3 * dt
  end

  -- Update weapons
  for i, weapon in ipairs(self.weapons) do
    weapon:update(dt)
  end

  -- Movement is handled in three steps and is absolutely mental
  -- Refer to each individual function for more detailed explanations
  -- It works like a charm, btw ;)
  self:handleMovement(dt)
  self:handleMovementPost(dt)
  self:brake(dt)

  -- Update Ship
  self.ship:update(dt, self.x, self.y, self.vx, self.vy)

  -- gvy = -20/256 * self.y + 10
  -- -10 when at the bottom, +10 when at the top
  -- Updated every two frames
  if t % 2 == 0 then
    gvy = -0.078 * self.y + 10
  end
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
  game.gs.isAlive = false -- On player destruction the isAlive flag is set to false
  ExplosionMed(self.x, self.y) -- An explosion is created where the player stood
  music.tracks.feathers:stop() -- The music is stopped -- TODO IT DOESNT REALLY STOP!!
  TEsound.play("bgm/death-noloop.ogg", "dead") -- The death fanfare is played
end

function Player:reset ()
  -- Respawning the player puts them right in the middle of the screen
  self.x = width/2
  self.y = 300

  -- Resets all counters
  self.hp = self.ship.mhp
  self.sp = self.ship.msp
  self.pp = self.ship.mpp
end

function Player:draw ()
  -- Draw the player only if they are alive
  if game.gs.isAlive then
    -- Calculate the middle point...
    local nx = math.floor(self.x - self.w / 2)
    local ny = math.floor(self.y - self.h / 2)
    self.ship:draw(nx, ny)

    -- Draw debug information if needed
    if debug >= 2 then
      love.graphics.setColor(150, 170, 255, 255)
      love.graphics.circle("line", self.x, self.y, self.ship.radius, 16)
      love.graphics.setColor(255, 255, 255, 255)
    end

  end
end
