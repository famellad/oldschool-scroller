Class = require 'libs.hump.class'

-- Inherit from GuiElement
GuiContainer = Class{__includes = GuiContainer}

function GuiContainer:init(x, y)
  self.x = x
  self.y = y

  self.selectedIndex = 0
end

function GuiContainer:update(dt)
  GuiElement.update(self, dt)
end

function GuiContainer:draw(dt)
  GuiElement.draw(self.dt)
end
