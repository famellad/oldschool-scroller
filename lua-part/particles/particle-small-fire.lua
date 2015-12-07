require 'libs.hump.class'

ParticleSmallFire = Class{__includes=Particle}

function ParticleSmallFire:init(x, y, vx, vy, maxAge, damp)
  Particle.init(self, x, y)

  self.vx = vx
  self.vy = vy

  self.damp = damp

  local isLong = math.random(20)
  local extra = 0

  if isLong > 19 then
    extra = 1
  end

  self.maxAge = maxAge + math.random(4) / 10 + extra

  self.img = love.graphics.newImage("gfx/parts/particles/grey-pixel.png")
end

function ParticleSmallFire:update(dt)
  Particle.update(self, dt)
  self.x = self.x + self.vx
  self.y = self.y + self.vy

  self.vx = self.vx * self.damp
  self.vy = self.vy * self.damp
end

function ParticleSmallFire:draw()
  local R = 255
  local G = 255 - 155 * (self.age / self.maxAge)
  local B = 80 - 70 * (self.age / self.maxAge)
  local A = 255 - 200 * (self.age / self.maxAge)

  love.graphics.setColor(R, G, B, 255)
    Particle.draw(self)
  love.graphics.setColor(255, 255, 255, 255)
end
