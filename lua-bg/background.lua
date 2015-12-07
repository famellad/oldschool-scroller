Class = require 'libs.hump.class'

Background = Class{}
Background.img = nil

function Background:init()
  self.x = -10
  self.y = 0
  self.vx = 1/6
  self.vy = 20
  self.img = love.graphics.newImage('gfx/back/back-black.png')
end

function Background:update (dt)
  self.y = self.y + self.vy * dt
  self.x = width - game.gs.player.x * self.vx - 200
  if self.y >= self.img:getHeight() then
    self.y = 0
  end
end

function Background:draw ()
  love.graphics.draw(self.img, self.x, self.y)
end

function Background.getNew()
  local rback = math.random(2)
  if rback == 1 then
    return BackNebula()
  elseif rback == 2 then
    return BackEagle()
  end
end
