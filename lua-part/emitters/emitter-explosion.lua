require 'libs.hump.class'

EmitterExplosion = Class{__includes=Emitter}

function EmitterExplosion:init(x, y)
  Emitter.init(self, x, y)
  self.damp = 0.92

  self.newParticleTimerMax = 0.005
  self.active = true

  self:emitOnce()
end

function EmitterExplosion:update(dt, dx, dy, dvx, dvy)
  Emitter.update(self, dt, dx, dy, dvx, dvy)
end

function EmitterExplosion:emit(dx, dy, dvx, dvy)

end

function EmitterExplosion:emitOnce()
  for i=1,5 do
    local newParticle = ParticleSmallFire(self.x, self.y,  (math.random(16) - 8) / 3, (math.random(16) - 8) / 3, 0.3, self.damp) -- x, y, vx, vy
    table.insert(self.particles, newParticle)
  end
end

function EmitterExplosion:draw()
  Emitter.draw(self)
end
