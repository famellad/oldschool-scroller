Class = require 'libs.hump.class'

Scene = Class{}

-- The scene class is what's beig shown of screen from the game
-- For instance the play area, the main menu, the title screen
-- These definitions are just an interface

function Scene:init()
  self.state = 0
end

function Scene:HandleInput(e)
  -- Each scene type will handle input differently
  -- Yet, we always have to check the bind table
  game.controller:checkBindTable()
end

function Scene:update(dt)
  --self:HandleInput("this is useless")
end

function Scene:draw()

end
