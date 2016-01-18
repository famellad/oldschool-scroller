Class = require "libs.hump.class"

ChallengeRest = Class{__includes = Challenge}

-- This is the challenge that plays between challenges
-- To let the player BREATHE
function ChallengeRest:init()
  -- Initialize parent
  Challenge.init(self)

  self.name = "Resting"
  self.completionThreshold = 300 -- The challenge lasts for 300 frames (5 seconds)
end

function ChallengeRest:update(dt)
  -- Update parent maybe
  Challenge.update(self, dt)
  -- Do absolutely nothing for 5 seconds
  -- Well... Actually just increase the timer
  self.currentScore = self.currentScore + 1 * dt
end

function ChallengeRest:draw()
  -- Draw nothing
end
