Class = require 'libs.hump.class'

ExplosionMed = Class{__includes=Explosion}

-- The bread and butter of all explosions
function ExplosionMed:init(x, y)
  Explosion.init(self, x, y)
  self.frames = 12
  self.w = 32
  self.h = 32

  -- The explosion has a random rotation so different explosions
  -- Look different sometimes
  self.r = math.random(0,4) * math.pi / 4

  -- An explosion emitter is created
  self.emitter = EmitterExplosion(x, y)

  self.img = love.graphics.newImage('gfx/parts/explosion.png')
  self.anim = newAnimation(self.img, self.w, self.h, 0.05, 0)

  -- Explosion sound is played upon creation
  TEsound.play("sfx/explosion-med.ogg", "", 0.8, math.random(8, 11) / 10)
end

function ExplosionMed:update(dt, i)
  Explosion.update(self, dt, i)
  self.emitter:update(dt, 0, 0, 0, 0)
end

function ExplosionMed:draw()
  -- Tried using other blend modes, didn't work very well
  --love.graphics.setBlendMode("alpha")
  Explosion.draw(self)
  --love.graphics.setBlendMode("alpha")
  self.emitter:draw()
end
