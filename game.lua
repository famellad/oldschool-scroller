Class = require 'libs.hump.class'

Game = Class{}

function Game:init()
  self.gs = GameState() -- initialize an EMPTY gamestate
end

function Game:update(dt)
  self.gs:update(dt) -- update the current gamestate
end

function Game:draw ()
  love.graphics.setCanvas(canvas)
    self.gs:draw()
  love.graphics.setCanvas()
end
