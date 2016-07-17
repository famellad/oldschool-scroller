Class = require 'libs.hump.class'

-- Inherit from GuiElement
GuiContainer = Class{__includes = GuiContainer}

function GuiContainer:init(x, y)
  self.x = x
  self.y = y

  -- The elements contained in this container
  self.elements = {}

  -- Which element is currently selected?
  self.selectedIndex = 0

  -- How are these elements aligned?
  self.alignment = 0 -- 0: centered, 1: left, 2: right
end

function GuiContainer:AddElement(element)
  table.insert(self.elements, element)
  -- TODO align this thing
end

function GuiContainer:update(dt)
  GuiElement.update(self, dt)
end

function GuiContainer:draw(dt)
  GuiElement.draw(self.dt)
end
