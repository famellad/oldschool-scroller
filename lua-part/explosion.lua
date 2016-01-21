explosions = {} -- This is a global list holding all explosions, which is hella wrong
                -- It should be a list on the scene or at least gamestate
                -- Or better yet, an object holding all explosions
                -- TODO FIX THIS PLEASE

-- Function to update all explosions
function explosions.update (dt)
  for i, exp in ipairs(explosions) do
    exp:update(dt, i)
  end
end

-- Function to draw all explosions
function explosions.draw ()
  for i, exp in ipairs(explosions) do
    exp:draw()
  end
end

Class = require 'libs.hump.class'
Explosion = Class{}

-- Prototypical Explosion class, from which all different explosions inherit
function Explosion:init(x, y)
  self.x = x -- Coordinates for the explosion
  self.y = y

  self.frames = 1 -- How many frames does it have
  self.frame = 0  -- ...And what frame is it on

  self.w = 2 -- Size of the explosion
  self.h = 2

  self.r = 0 -- Rotation

  self.anim = newAnimation(love.graphics.newImage('gfx/nul.png'), 2, 2, 0.1, 0)

  -- Inserts itself into the table upon creation
  table.insert(explosions, self)
end

function Explosion:update(dt, i)
  -- Internally play at ten times the regular speed because there's something weird going on
  -- TODO FIXME
  self.frame = self.frame + 10 * dt
  self.anim:update(dt)

  if self.frame > self.frames then
    -- Remove the explosion once it's no longer needed
    table.remove(explosions, i)
  end
end

function Explosion:draw()
  -- Draw the animation frame
  self.anim:draw(self.x, self.y, self.r, 1, 1, self.w / 2, self.h / 2)
end
