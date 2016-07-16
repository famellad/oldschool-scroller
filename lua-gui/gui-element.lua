Class = require 'libs.hump.class'

-- Gui elements will be treated as entities for ease of use
GuiElement = Class{__includes = Entity}

function GuiElement:init(x, y, index)
  self.x = x
  self.y = y

  -- The order in which elements will cycle
  self.index = index

  -- Whether the element is selectable
  self.active = true

  -- Wether the element is selected
  self.selected = false
end

function GuiElement:update(dt)
  Entity.update(self, dt)
end

function GuiElement:draw(dt)
  Entity.draw(self, dt)
end
