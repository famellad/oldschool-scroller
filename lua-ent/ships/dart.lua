Class = require 'libs.hump.class'

ShipDart = Class{__includes = Ship}

function ShipDart:init()
  self.radius = 5  -- Radius for collisions
  self.maxv = 200    -- Maximum velocity
  self.acc = 900     -- Acceleration
  self.mhp = 60     -- Maximum HP
  self.msp = 30     -- Maximum SP
  self.mpp = 50     -- Maximum PP

  self.img = love.graphics.newImage('gfx/sprites/pship-dart.png')   -- Ship model
end
