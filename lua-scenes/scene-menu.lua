Class = require 'libs.hump.class'

SceneMenu = Class{__includes = Scene}

function SceneMenu:init()
  -- A menu MUST have a container
  self.optionsContainer = GuiContainer(0, 0)

  self.keyPressed = false
end

function SceneMenu:HandleInput(e)
  Scene.HandleInput(self, e)

  -- First we handle the pad
  if game.controller.padDown then
    if not self.keyPressed then self.optionsContainer:NextElement() end
    self.keyPressed = true
  elseif game.controller.padUp then
    if not self.keyPressed then self.optionsContainer:PrevElement() end
    self.keyPressed = true
  elseif game.controller.padLeft then
    if not self.keyPressed then self.optionsContainer:PassLeft() end
    self.keyPressed = true
  elseif game.controller.padRight then
    if not self.keyPressed then self.optionsContainer:PassRight()end
    self.keyPressed = true
  else
    self.keyPressed = false
  end
end

function SceneMenu:update(dt)
  self:HandleInput("uselesss")

  -- Update menus
  self.optionsContainer:update(dt)
end

function SceneMenu:draw()

end
