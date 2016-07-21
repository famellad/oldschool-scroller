Class = require 'libs.hump.class'

SceneMainMenu = Class{__includes = SceneMenu}

-- This scene is the main menu where you can select
-- Either continue, new game, options or credits
function SceneMainMenu:init()
  self.imgBlk = love.graphics.newImage('gfx/titles/black.png')

  -- Initialize container with buttons
  self.optionsContainer = GuiContainer(100, 100)
  -- Add said buttons
  self.optionsContainer:AddElement(GuiButton(0, 0, 0, "Continue"))
  self.optionsContainer:AddElement(GuiButton(0, 0, 1, "New Game"))
  self.optionsContainer:AddElement(GuiButton(0, 0, 2, "Options"))
  self.optionsContainer:AddElement(GuiButton(0, 0, 3, "Credits"))
  self.optionsContainer:AddElement(GuiButton(0, 0, 4, "Quit Game"))
end

function SceneMainMenu:back()
  game.scene = SceneTitle(2)
end

function SceneMainMenu:forward()

end

function SceneMainMenu:update(dt)
  SceneMenu.update(self, dt)
  self.optionsContainer.elements[1].text = "Continue " .. self.optionsContainer.selectedIndex
end

function SceneMainMenu:draw(dt)
  -- Draw a black backdrop
  love.graphics.draw(self.imgBlk, 0, 0)
  -- Draw title
  -- Draw eyecandy
  -- Draw options
  self.optionsContainer:draw(dt)
end
