Class = require 'libs.hump.class'

Fonts = Class{}

function Fonts:init()
  -- Mapping of the Fat Hammer font used for most (if not all) of the text ingame,
  -- Look at the png image for more reference
  self.fatHammer = love.graphics.newImageFont("gfx/gui/pf-fat-hammer.png",
  " abcdefghijklmnopqrstuvwxyz" ..
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ..
  "0123456789:./()-<>")
end
