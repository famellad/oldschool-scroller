Class = require 'libs.hump.class'

ExplosionMed = Class{__includes=Explosion}

function ExplosionMed:init(x, y)
  Explosion.init(self, x, y)
  self.frames = 12
  self.w = 32
  self.h = 32

  self.r = math.random(1, 20) / 10

  self.emitter = EmitterExplosion(x, y)

  self.img = love.graphics.newImage('gfx/parts/explosion.png')
  self.anim = newAnimation(self.img, self.w, self.h, 0.05, 0)
  TEsound.play("sfx/explosion-med.ogg", "", 0.8, math.random(8, 11) / 10)
end

function ExplosionMed:update(dt, i)
  Explosion.update(self, dt, i)
  self.emitter:update(dt, 0, 0, 0, 0)
end

function ExplosionMed:draw()
  Explosion.draw(self)
  self.emitter:draw()
end
