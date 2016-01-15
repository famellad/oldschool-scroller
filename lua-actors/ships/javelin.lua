Class = require 'libs.hump.class'

ShipJavelin = Class{__includes = Ship}

function ShipJavelin:init()
  self.radius = 15  -- Radius for collisions
  self.maxv = 90    -- Maximum velocity
  self.acc = 450     -- Acceleration
  self.mhp = 250     -- Maximum HP
  self.msp = 100     -- Maximum SP
  self.mpp = 160     -- Maximum PP

  self.img = love.graphics.newImage('gfx/sprites/pship-javelin.png')   -- Ship model
end
