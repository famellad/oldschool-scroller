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
  BackSpaceProto.draw(self)
end
