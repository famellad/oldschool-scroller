Class = require 'libs.hump.class'

Game = Class{}

function Game:init()
  self.gs = GameState() -- initialize an EMPTY gamestate
  self.scene = SceneTitle() -- temporarily store just the title screen
  self.tmpState = 0 -- 0 is titles screen, do this temporarily
end

function Game:update(dt)
  if self.tmpState == 0 then
    self.scene:update(dt)
  else
    music.tracks.feathers:play()
    self.gs:update(dt) -- update the current gamestate
  end
end

function Game:draw ()
  love.graphics.setCanvas(canvas)
    if self.tmpState == 0 then
      self.scene:draw()
    else
      self.gs:draw()
    end

  love.graphics.setCanvas()
end
