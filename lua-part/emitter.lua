require 'libs.hump.class'

Emitter = Class{}

function Emitter:init(x, y)
  self.x = x
  self.y = y
  self.damp = 1

  self.active = true

  self.newParticleTimer = 0
  self.newParticleTimerMax = 1

  self.particles = {}
end

function Emitter:update(dt, dx, dy, dvx, dvy)
  for i, part in ipairs(self.particles) do
    part:update(dt)
    if part.age >= part.maxAge then
      table.remove(self.particles, i)
    end
  end

  if self.active then
    self.newParticleTimer = self.newParticleTimer + 1 * dt
    if self.newParticleTimer >= self.newParticleTimerMax then
      self.newParticleTimer = 0
      self:emit(dt, dx, dy, dvx, dvy)
    end
  end
end

function Emitter:emit(dt, dx, dy)
  -- Emit the thing
end

function Emitter:draw()
  for i, part in ipairs(self.particles) do
    part:draw()
  end
end
