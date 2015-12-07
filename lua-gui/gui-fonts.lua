Class = require 'libs.hump.class'

Fonts = Class{}

function Fonts:init()
  self.fatHammer = love.graphics.newImageFont("gfx/gui/pf-fat-hammer.png",
  " abcdefghijklmnopqrstuvwxyz" ..
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ..
  "0123456789:./()-")
end
