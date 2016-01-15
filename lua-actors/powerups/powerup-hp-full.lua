Class = require 'libs.hump.class'

PowerupHPFull = Class{__includes = Powerup}

-- Powerup that restores full health
-- HP, PPFULL, PP, SP and SPFULL follow the same scheme and are not comented
function PowerupHPFull:init(x, y)
  Powerup.init(self, x, y)
  self.vy = 20 -- The vertical velocity at which the powerup falls

  self.w = 15 -- The width of the powerup
  self.h = 15 -- The height of the powerup

  self.img = love.graphics.newImage('gfx/sprites/pup-cont-hp-full.png')

  self.anim = newAnimation(self.img, self.w, self.h, 0.1, 8)
end

function PowerupHPFull:update(dt)
  Powerup.update(self, dt)
  self.anim:update(dt)
end

function PowerupHPFull:effect(player)
  Powerup.effect(self, player)
  player.hp = player.ship.mhp -- Makes the player health equal to the ship's max health
end

function PowerupHPFull:draw()
  -- Obtain the centre point
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  self.anim:draw(nx, ny)

  Powerup.draw(self)
end
