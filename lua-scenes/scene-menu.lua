Class = require 'libs.hump.class'

SceneMenu = Class{__includes = Scene}

function SceneMenu:init()
  -- A menu MUST have a container
  self.optionsContainer = GuiContainer(0, 0)
end

function SceneMenu:HandleInput(e)
  Scene.HandleInput(self, e)

end

function SceneMenu:update(dt)

end

function SceneMenu:draw()

end
