Class = require 'libs.hump.class'

BulletSystem = Class{}

function BulletSystem:init()
  self.pad = 100
  self.bullets = {}
end

function BulletSystem:update(dt)
  -- local removalIndices = {}
  for i, bullet in ipairs(self.bullets) do
    bullet:update(dt)

    if bullet.x > width + self.pad
    or bullet.x < 0 - self.pad
    or bullet.y > height + self.pad
    or bullet.y < 0 - self.pad then
      table.remove(self.bullets, i)
    end
  end
end

function BulletSystem:draw()
  for i, bullet in ipairs(self.bullets) do
    bullet:draw()
  end
end

function BulletSystem:addBullet(bullet)
  table.insert(self.bullets, bullet)
end

function BulletSystem:removeBullet(index)
  table.remove(self.bullets, i)
end
