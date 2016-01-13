Class = require 'libs.hump.class'

BackSimu = Class{__includes = Background}

function BackSimu:init()
  Background.init(self)
  self.img = love.graphics.newImage('gfx/back/back-simu.png')

  -- We want to show the shadow in this stage
  self.shadow = true

  -- List to hold the side glitches
  self.glitches = {}
end

function BackSimu:update(dt)
  -- We age all the glitches
  for i, glitch in ipairs(self.glitches) do
    glitch.age = glitch.age + 1
    -- If the glitch has been alive for more than one tick, remove it.
    if glitch.age == 1 then
      table.remove(self.glitches, i)
    end
  end

  -- Create ten new glitches for the left side of the background
  for i = 0, 9 do
    -- X is fixed, yet y, w and h are random
    newGlitch = {x = 25, y = i * height / 10 + math.random(10) - 5, w = math.random(2, 12), h = math.random(10, 50), age = 0}
    -- Add the glitch to the table of glitches
    table.insert(self.glitches, newGlitch)
  end

  -- Create ten new glitches for the right side of the background
  for i = 0, 9 do
    -- X is fixed, but offset by the random width, yet y, w and h are random
    local rw = math.random(2, 12)
    newGlitch = {x = 230 - rw, y = i * height / 10 + math.random(10) - 5, w = rw, h = math.random(10, 50), age = 0}
    -- Add the glitch to the table of glitches
    table.insert(self.glitches, newGlitch)
  end

  -- Update parent
  Background.update(self, dt)
end

function BackSimu:draw()
  -- Draw the background
  Background.draw(self)

  -- Above that draw all glitches
  love.graphics.setColor(34, 34, 34, 255)
  for i, glitch in ipairs(self.glitches) do
    love.graphics.rectangle("fill", glitch.x + self.x, glitch.y, glitch.w, glitch.h)
  end
  love.graphics.setColor(255, 255, 255, 255)
end
