require 'libs.hump.class'

EmitterExplosion = Class{__includes=Emitter}

-- This is the particle effect that plays at the same
-- Time an explosion is rendered, it adds some nice flying particles
function EmitterExplosion:init(x, y)
  Emitter.init(self, x, y)
  self.damp = 0.92 -- The particles are dampened

  self.newParticleTimerMax = 0.005
  self.active = true

  self:emitOnce() -- There is only one emission, at creation time
end

function EmitterExplosion:update(dt, dx, dy, dvx, dvy)
  Emitter.update(self, dt, dx, dy, dvx, dvy)
end

function EmitterExplosion:emit(dx, dy, dvx, dvy)
  -- The emit function is empty, emitOnce is used instead
end

function EmitterExplosion:emitOnce()
  for i=1,5 do -- Emit 5 particles in random directions
    local newParticle = ParticleSmallFire(self.x, self.y,  (math.random(16) - 8) / 3, (math.random(16) - 8) / 3, 0.3, self.damp)
    table.insert(self.particles, newParticle)
  end
end

function EmitterExplosion:draw()
  Emitter.draw(self)
end
