Class = require 'libs.hump.class'

-- Inherit from GuiElement
GuiNumber = Class{__includes = GuiElement}

function GuiNumber:init(x, y, index, text, min, max)
  self.x = x
  self.y = y

  self.min = min
  self.max = max

  self.index = index
  self.text = text
end

function GuiNumber:update(dt)
  GuiElement.update(self, dt)
end

function GuiNumber:draw(dt)
  GuiElement.draw(self, dt)

  -- Draw the thing...
  if self.selected then
    love.graphics.print(text, x, y)
  else
    -- A little bit darker if it's not selected
    love.graphics.setColor(200, 200, 200, 255)
      love.graphics.print(text, x, y)
    love.graphics.setColor(255, 255, 255, 255)
  end
end
