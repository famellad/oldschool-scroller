Class = require 'libs.hump.class'

PowerupSP = Class{__includes = Powerup}

-- Comments are on PowerupHPFull
function PowerupSP:init(x, y)
  Powerup.init(self, x, y)
  self.vy = 20

  self.w = 15
  self.h = 15

  self.img = love.graphics.newImage('gfx/sprites/pup-cont-sp.png')

  self.anim = newAnimation(self.img, self.w, self.h, 0.1, 8)
end

function PowerupSP:update(dt)
  Powerup.update(self, dt)
  self.anim:update(dt)
end

function PowerupSP:effect(player)
  Powerup.effect(self, player)
  player.sp = math.min(player.ship.msp, player.sp + player.ship.msp / 3)
end

function PowerupSP:draw()
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  self.anim:draw(nx, ny)

  Powerup.draw(self)
end
