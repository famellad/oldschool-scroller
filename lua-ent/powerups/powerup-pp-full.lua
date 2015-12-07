Class = require 'libs.hump.class'

PowerupPPFull = Class{__includes = Powerup}

function PowerupPPFull:init(x, y)
  Powerup.init(self, x, y)
  self.vy = 20

  self.w = 15
  self.h = 15

  self.img = love.graphics.newImage('gfx/sprites/pup-cont-pp-full.png')

  self.anim = newAnimation(self.img, self.w, self.h, 0.1, 8)
end

function PowerupPPFull:update(dt)
  Powerup.update(self, dt)
  self.anim:update(dt)
end

function PowerupPPFull:effect(player)
  Powerup.effect(self, player)
  player.pp = player.ship.mpp
end

function PowerupPPFull:draw()
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  self.anim:draw(nx, ny)

  Powerup.draw(self)
end
