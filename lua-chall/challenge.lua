Class = require "module"

Challenge = Class{}

-- Prototypical challenge class
function Challenge:init ()
  self.name = ""               -- Name of the Challenge
  self.currentScore = 0        -- Variable holding the current score for the challenge
  self.completionThreshold = 0 -- Score required to pass the challenge
  self.completed = false       -- Whether the challenge has been completed
  self.showWarning = false     -- Whether to show a warning beforehand!
end

function Challenge:update(dt)
  -- Updates the logic of the challenge, controlling spawns and paths
  -- It is also possible to increment the score here, thus making
  -- Timed challenges rather than shooting challenges
  -- Good for parts that require the player to avoid something
  -- Rather than fight it
end

function Challenge:draw()
  -- Some challenges might want to draw an overlay,
  -- Like the length of an asteroid field, or the health of a boss, go nuts!
end
