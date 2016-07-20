Class = require 'libs.hump.class'

-- Inherit from GuiElement
GuiContainer = Class{__includes = GuiContainer}

function GuiContainer:init(x, y)
  self.x = x
  self.y = y

  -- The elements contained in this container
  self.elements = {}

  -- Which element is currently selected?
  self.selectedIndex = 1

  -- How are these elements aligned?
  self.alignment = 0 -- 0: centered, 1: left, 2: right
end

function GuiContainer:AddElement(element)
  -- The element coordinates are relative to the container
  element.x = element.x + self.x
  element.y = element.y + self.y

  -- We offset the element so each element has its own line
  element.y = element.y + element.height * TableLength(self.elements)

  table.insert(self.elements, element)
end

function GuiContainer:update(dt)
  GuiElement.update(self, dt)
  if TableLength(self.elements) > 1 then
    self.elements[1].selected = true
  end
end

function GuiContainer:draw(dt)
  --GuiElement.draw(self.dt)
  for i, element in ipairs(self.elements) do
    element:draw(dt)
  end
end
