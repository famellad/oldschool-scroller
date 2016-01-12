Class = require 'libs.hump.class'

BackSimu = Class{__includes = Background}

function BackSimu:init()
  Background.init(self)
  self.img = love.graphics.newImage('gfx/back/back-simu.png')
end

function BackSimu:update(dt)
  Background.update(self, dt)
end

function BackSimu:draw()
  Background.draw(self)
end
