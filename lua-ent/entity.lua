Class = require 'libs.hump.class'

Entity = Class{}

-- Prototype entity class, abstract. Not actually used
function Entity:init()
  self.img = nil
  self.x = nil
  self.y = nil
  self.vx = nil
  self.vy = nil
end

function Entity:update(dt)

end

function Entity:draw(dt)

end
