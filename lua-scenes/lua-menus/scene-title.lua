Class = require 'libs.hump.class'

SceneTitle = Class{__includes = SceneMenu}

-- This scene corresponds to the title screens
function SceneTitle:init()
  -- Current state of the title screen thingy
  self.state = 0

  self.imgBlk = love.graphics.newImage('gfx/titles/black.png')
  self.imgTIF = love.graphics.newImage('gfx/titles/thisisfine.png')
  self.imgL2D = love.graphics.newImage('gfx/titles/love2d.png')
  self.imgTitle = nil -- Load image
  -- 0: Showing "THIS IS FINE"
  -- 1: Showing "LÖVE"
  -- 2: (MAYBE)Intro//Showing <name> and Press Start
  self.currentStateDuration = 0 -- Temp variable to hold how long the title has been onscreen
  self.titlesDuration = 4.6 -- In seconds

  music.tracks.shoot:play() -- Play some music, fam
end

function SceneTitle:HandleInput()
  -- TODO handle this
end

function SceneTitle:update(dt)
  -- Add to the timer and check whether the title has been for the right amount of time
  -- If it has, advance the state once and reset the timer
  self.currentStateDuration = self.currentStateDuration + 1 * dt -- Adds one per second
  if self.currentStateDuration >= self.titlesDuration and self.state < 2 then
    self.state = self.state + 1
    self.currentStateDuration = 0
  end
end

function SceneTitle:draw()
  -- Draw a black backdrop
  love.graphics.draw(self.imgBlk, 0, 0)

  -- Draw the title according to the current state
  if self.state == 0 then
    love.graphics.draw(self.imgTIF, 0, 0)
    --love.graphics.print("THIS IS FINE", 80, 100)
  elseif self.state == 1 then
    love.graphics.draw(self.imgL2D, 0, 0)
  elseif self.state == 2 then
    -- Draw imgTitle
    -- Draw Press Start
    if math.floor(t / 60 % 2) == 0 then
      love.graphics.print("PRESS START", 80, 150)
    end
  end
end
