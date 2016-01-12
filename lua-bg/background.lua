Class = require 'libs.hump.class'

Background = Class{}
Background.img = nil

function Background:init()
  -- Movement variables
  self.x = -10  -- X displacement of the background map :: dynamic
  self.y = 0    -- Y displacement of the background map :: dynamic (movement)
  self.vx = 1/6 -- Speed at which the background moves when the player moves left/right
  self.vy = 20  -- Velocity of scrolling

  -- We load a placeholder image, it is just black
  -- TODO this image is too large, do the resizing thing
  self.img = love.graphics.newImage('gfx/back/back-black.png')

  self.event = 0 -- What's currently going on in the background
end

function Background:update (dt)
  -- We scroll the background one tick
  self.y = self.y + self.vy * dt

  -- We parallax the background relative to the player position
  -- TODO THESE VALUES ARE EMPIRICAL AND PROBABLY CAN BE OPTIMISED
  self.x = width - game.gs.player.x * self.vx - 198

  -- If the background is out of bounds, then we scroll it background
  if self.y >= self.img:getHeight() then
    self.y = 0
  end
end

function Background:draw ()
  -- Draw the tileable background once, at the regular position
  love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y))
  -- Then draw it again, offset one height, so it appears to be continuous
  love.graphics.draw(self.img, math.floor(self.x), math.floor(self.y - self.img:getHeight()))
end

-- Function to obtain a new random background
-- Probably DEPRECATED
function Background.getNew()
  --[[local rback = math.random(2)
  if rback == 1 then
    return BackNebula()
  elseif rback == 2 then
    return BackEagle()
  end]]
  return BackSimu()
end
