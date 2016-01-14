require 'libs.hump.class'

EmitterExhaust = Class{__includes=Emitter}

-- Unused emitter that simulates an exhaust, might be
-- interestingly repurposed as fire, or some other slow moving particle
function EmitterExhaust:init(x, y, size)
  Emitter.init(self, x, y)

  self.size = size

  self.newParticleTimerMax = 0.02
  self.active = true
end

function EmitterExhaust:update(dt, dx, dy, dvx, dvy)
  -- It requires all this information to calculate the sway of the particles it emits
  Emitter.update(self, dt, dx, dy, dvx, dvy)
  --self:emit(dt, dx, dy, dvx, dvy)
end

function EmitterExhaust:emit(dt, dx, dy, dvx, dvy)
  -- Small random deviation
  local place = math.random(self.size) - self.size/2

  -- Create a small fire particle, that sways in the movement direction
  local newParticle = ParticleSmallFire(self.x + dx + place, self.y + dy, 0 - place/30 + dvx / 100, 0.5 + dvy / 100, 0.1, self.damp)

  -- Insert said particle into the particle list
  table.insert(self.particles, newParticle)
end

function EmitterExhaust:draw()
  -- Draw all particles
  Emitter.draw(self)
end
