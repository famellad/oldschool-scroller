Class = require 'libs.hump.class'

BulletHammer = Class{__includes=Bullet}

-- Hammer bullet
function BulletHammer:init(x, y, level, goUp)
  Bullet.init(self, x, y, level, goUp)

  self.vx = math.random(-8, 8) -- The bullet has a small sway
  self.vy = 250 + 30 * level
  self.dam = 5 + 2.5 * level

  self.w = 5
  self.h = 10

  if level == 0 then
    self.img = bulletImgs.hammer0Img
    self.w = 5
    self.h = 8
  elseif level == 1 then
    self.img = bulletImgs.hammer1Img
  else
    self.img = bulletImgs.hammer2Img
  end

  self:flip()
end

function BulletHammer:update(dt)
  Bullet.update(self, dt)
end

function BulletHammer:draw()
  Bullet.draw(self)
end
