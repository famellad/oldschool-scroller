require 'libs.hump.class'

Emitter = Class{}

function Emitter:init(x, y)
  self.x = x    -- Coordinates for the Emitter
  self.y = y
  self.damp = 1 -- Damping factor for the particles

  self.active = true -- Whether the emitter is emitting particles

  self.newParticleTimer = 0    -- Timer for particle emission
  self.newParticleTimerMax = 1 -- How often should the emitter emit particles

  self.particles = {} -- Table to hold the particles
end

function Emitter:update(dt, dx, dy, dvx, dvy)
  -- Iterate through all the particles
  for i, part in ipairs(self.particles) do
    -- Update them individually
    part:update(dt)
    -- Remove all the particles that are above tha max age
    if part.age >= part.maxAge then
      table.remove(self.particles, i)
    end
  end

  -- If the emitter is active, create a new particle and reset the timer
  if self.active then
    self.newParticleTimer = self.newParticleTimer + 1 * dt
    if self.newParticleTimer >= self.newParticleTimerMax then
      self.newParticleTimer = 0
      self:emit(dt, dx, dy, dvx, dvy)
    end
  end
end

-- This is a prototype function
function Emitter:emit(dt, dx, dy)
  -- Emit the thing
end

function Emitter:draw()
  -- Iterate through all the particles and draw each one of them
  for i, part in ipairs(self.particles) do
    part:draw()
  end
end
