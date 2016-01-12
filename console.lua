Class = require 'libs.hump.class'

Console = Class{}

function Console:init()
  self.toggled = false -- Boolean representing whether the console is displayed
  self.lineBuffer = {} -- Empty list to represent the buffer
  self.textBuffer = "" -- Empty string to represent the current string
end

function Console:update(dt)
  while table.getn(self.lineBuffer) > 1024 do
    table.remove(self.lineBuffer, 0)
  end
end

function Console:addToLineBuffer(text)
  table.add(self.lineBuffer, text)
end

function Console:setTextBuffer(text)
  self.textBuffer = text
end

function Console:draw()
  if self.toggled then -- Only draw when toggled
    love.graphics.setColor(0, 0, 0, 127)
      love.graphics.rectangle("fill", 0, 0, 1366, 768) -- TODO REMOVE THESE VALUES MAKE THEM DYNAMIC
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print("arrow> " .. self.textBuffer, 4, 4) -- Print the current text buffer
  end
end
