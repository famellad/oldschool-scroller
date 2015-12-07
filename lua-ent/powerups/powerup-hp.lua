Class = require 'libs.hump.class'

PowerupHP = Class{__includes = Powerup}

function PowerupHP:init(x, y)
  Powerup.init(self, x, y)
  self.vy = 20

  self.w = 15
  self.h = 15

  self.img = love.graphics.newImage('gfx/sprites/pup-cont-hp.png')

  self.anim = newAnimation(self.img, self.w, self.h, 0.1, 8)
end

function PowerupHP:update(dt)
  Powerup.update(self, dt)
  self.anim:update(dt)
end

function PowerupHP:effect(player)
  Powerup.effect(self, player)
  player.hp = math.min(player.ship.mhp, player.hp + player.ship.mhp / 3)
end

function PowerupHP:draw()
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  self.anim:draw(nx, ny)

  Powerup.draw(self)
end
