Class = require 'libs.hump.class'

SceneMenu = Class{__includes = Scene}

function SceneMenu:init()
  -- A menu MUST have a container
  self.optionsContainer = GuiContainer(0, 0)
end

function SceneMenu:back()
  -- Each scene should implement its own back function
end

function SceneMenu:forward()
  -- Same goes for forward
end

function SceneMenu:HandleInput(e)
  Scene.HandleInput(self, e)

  self.keyPressed = 1

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

  -- Then we get nice and wet
  -- I mean, we handle the buttons
  if game.controller.butBot or game.controller.butStart then
    -- Both start and A go forward
    if not self.keyPressed then self:forward() end
    self.keyPressed = true
  elseif game.controller.butRight then
    -- B goes back
    if not self.keyPressed then self:back() end
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
