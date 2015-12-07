require 'libs.hump.class'

EmitterExhaust = Class{__includes=Emitter}

function EmitterExhaust:init(x, y, size)
  Emitter.init(self, x, y)

  self.size = size

  self.newParticleTimerMax = 0.02
  self.active = true
end

function EmitterExhaust:update(dt, dx, dy, dvx, dvy)
  Emitter.update(self, dt, dx, dy, dvx, dvy)
  --self:emit(dt, dx, dy, dvx, dvy)
end

function EmitterExhaust:emit(dt, dx, dy, dvx, dvy)
  local place = math.random(self.size) - self.size/2
  local newParticle = ParticleSmallFire(self.x + dx + place, self.y + dy, 0 - place/30 + dvx / 100, 0.5 + dvy / 100, 0.1, self.damp) -- x, y, vx, vy
  table.insert(self.particles, newParticle)
end

function EmitterExhaust:draw()
  Emitter.draw(self)
end
