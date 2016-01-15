Class = require 'libs.hump.class'

Ship = Class{}

--Ship prototype
function Ship:init()
  self.radius = 1  -- Radius for collisions
  self.maxv = 0    -- Maximum velocity
  self.acc = 0     -- Acceleration
  self.mhp = 1     -- Maximum HP
  self.msp = 0     -- Maximum SP
  self.mpp = 0     -- Maximum PP

  self.img = nil   -- Ship model
end

function Ship:update(dt)

end

function Ship:draw(x, y)
  -- Draw the image
  love.graphics.draw(self.img, x, y, 0)
end
