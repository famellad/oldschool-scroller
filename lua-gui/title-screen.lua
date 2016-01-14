require 'libs.hump.class'

TitleScreen = Class{}

-- Prototype class for a title screen
function TitleScreen:init()
  self.img = nil
  self.animg = nil
  self.anim = nil
end

function TitleScreen:update(dt)
  -- update animation
end

function TitleScreen:draw()
  -- draw img and anim over that
end
