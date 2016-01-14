require 'libs.hump.class'

ParticleSmallFire = Class{__includes=Particle}

-- Small particle that changes colour from bright orange to dim red :)
function ParticleSmallFire:init(x, y, vx, vy, maxAge, damp)
  Particle.init(self, x, y)

  self.vx = vx
  self.vy = vy

  self.damp = damp

  -- Some particles may stay for extra long
  local isLong = math.random(20)
  local extra = 0

  if isLong > 18 then
    extra = 1
  end

  -- Max age is random, plus some are really freaking long-lived
  self.maxAge = maxAge + math.random(4) / 10 + extra

  -- Use the white pixel image called grey-pixel
  self.img = love.graphics.newImage("gfx/parts/particles/grey-pixel.png")
end

function ParticleSmallFire:update(dt)
  -- Update the age
  Particle.update(self, dt)

  -- Move the particle
  self.x = self.x + self.vx
  self.y = self.y + self.vy

  -- Damp the particle
  self.vx = self.vx * self.damp
  self.vy = self.vy * self.damp
end

function ParticleSmallFire:draw()
  -- These values determine the colour and opacity of the particle
  -- And have been determined empirically, feel free to propose a better
  -- Alternative (like using a lookup table...)
  local R = 255
  local G = 255 - 155 * (self.age / self.maxAge)
  local B = 80 - 70 * (self.age / self.maxAge)
  local A = 255 - 200 * (self.age / self.maxAge)

  -- Set colour and draw the fiery pixel
  love.graphics.setColor(R, G, B, 255)
    Particle.draw(self)
  love.graphics.setColor(255, 255, 255, 255)
end
