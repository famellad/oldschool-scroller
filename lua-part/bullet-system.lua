Class = require 'libs.hump.class'

BulletSystem = Class{}

-- A bullet system is a collection of bullets
function BulletSystem:init()
  self.pad = 100 -- Amount of pixels the bullet can go offscreen before disappearing
  self.bullets = {} -- The table containing all the bullets
end

function BulletSystem:update(dt)
  -- Iterate and update for each bullet
  for i, bullet in ipairs(self.bullets) do
    bullet:update(dt)

    -- If the bullet is out of bounds, remove it from the table
    if bullet.x > width + self.pad
    or bullet.x < 0 - self.pad
    or bullet.y > height + self.pad
    or bullet.y < 0 - self.pad then
      table.remove(self.bullets, i)
    end
  end
end

function BulletSystem:draw()
  -- Iterate and draw each bullet
  for i, bullet in ipairs(self.bullets) do
    bullet:draw()
  end
end

function BulletSystem:addBullet(bullet)
  -- Receives a bullet object and adds it to the table
  table.insert(self.bullets, bullet)
end

function BulletSystem:removeBullet(index)
  -- Receives an index and removes that bullet from the table (useful when hitting stuff)
  table.remove(self.bullets, i)
end
