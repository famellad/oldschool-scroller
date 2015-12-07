Class = require 'libs.hump.class'

BackEagle = Class{__includes = BackSpaceProto}

function BackEagle:init()
  BackSpaceProto.init(self)
  self.img = love.graphics.newImage('gfx/back/back-eagle.png')
end

function BackEagle:update(dt)
  BackSpaceProto.update(self, dt)
end

function BackEagle:draw()
  love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y))
  love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y - self.img:getHeight()))
  BackSpaceProto.draw(self)
end
