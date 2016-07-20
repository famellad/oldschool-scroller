Class = require 'libs.hump.class'

-- Inherit from GuiElement
GuiButton = Class{__includes = GuiElement}

function GuiButton:init(x, y, index, text)
  self.x = x
  self.y = y

  -- The index of this button
  self.index = index

  -- The text to be displayed
  self.text = text

  -- And now, we calculate the box
  self:calcWidth()
  self:calcHeight()
end

function GuiButton:calcWidth()
  GuiElement.calcWidth(self)
  -- The width is the number of characters PLUS the width of each character
  -- 7px wide for FatHammer
  -- TODO create a dynamic way of calculating this
  self.width = 7 * self.text:len()
end

function GuiButton:calcHeight()
  GuiElement.calcHeight(self)
  -- Ditto
  -- TODO create a dynamic way of calculating this
  self.height = 11
end

function GuiButton:update(dt)
  GuiElement.update(self, dt)
end

function GuiButton:draw(dt)
  --GuiElement.draw(self, dt)

  -- Draw the thing...
  if self.selected then
    love.graphics.print(self.text, self.x, self.y)
  else
    -- A little bit darker if it's not selected
    love.graphics.setColor(100, 100, 100, 255)
      love.graphics.print(self.text, self.x, self.y)
    love.graphics.setColor(255, 255, 255, 255)
  end
end
