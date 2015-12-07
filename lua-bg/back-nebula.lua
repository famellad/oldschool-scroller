Class = require 'libs.hump.class'

BackNebula = Class{__includes = BackSpaceProto}

function BackNebula:init()
  BackSpaceProto.init(self)
  self.img = love.graphics.newImage('gfx/back/back-nebula.png')
end

function BackNebula:update(dt)
  BackSpaceProto.update(self, dt)
end

function BackNebula:draw()
  love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y))
  love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y - self.img:getHeight()))
  BackSpaceProto.draw(self)
end
