Class = require 'libs.hump.class'

ExplosionHit = Class{__includes=Explosion}

-- Small explosion effect that renders when a bullet hits an object
function ExplosionHit:init(x, y)
  Explosion.init(self, x, y)
  self.frames = 3
  self.w = 7
  self.h = 7

  self.img = love.graphics.newImage('gfx/parts/small-impact.png')
  self.anim = newAnimation(self.img, self.w, self.h, 0.1, 0)

  -- The hit sound is played on creation
  TEsound.play("sfx/hit.ogg", "", 0.8, math.random(10, 12) / 10)
end

function ExplosionHit:update(dt, i)
  Explosion.update(self, dt, i)
end

function ExplosionHit:draw()
  Explosion.draw(self)
end
