Class = require 'libs.hump.class'

SceneTitle = Class{__includes = Scene}

-- This scene is the main menu where you can select
-- Either continue, new game, options or credits
function SceneMainMenu:init()
  self.imgBlk = love.graphics.newImage('gfx/titles/black.png')

  -- Initialize container with buttons
end

function SceneMainMenu:update(dt)

end

function SceneMainMenu:draw(dt)
  -- Draw container with buttons
end
