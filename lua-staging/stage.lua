Class = require 'libs.hump.class'

Stage = Class{}

function Stage:init ()
  self.name = ""        -- Name for the stage
  self.act = 0          -- Act number

  self.background = nil
  --self.palette?

  -- TODO cutscenes
  -- self.initCutscene = nil
  -- self.endCutscene = nil

  self.challenges = {}     -- List of challenges that comprise the level
  self.bossChallenge = nil -- The challenge that is the boss
  self.bossFight = false   -- Whether a bossfight is currently unfolding
  self.done = false        -- Whether everything is dead

  self.currChallenge = 0 -- The challenge that is now
  self.lastChallenge = 0 -- Number of challenges (index)
end

function Stage:Load()
  -- Here is where all the challenges will be added one by one to make the level
  -- This function is prototypical
end

function Stage:postLoad ()
  self.lastChallenge = TableLength(self.challenges) - 1 -- What's the last challenge?
end

function Stage:nextChallenge ()
  if self.bossFight then -- If bossFight is true, it means the bossFight has been beaten
    self.done = true
    return nil -- return the null challenge!
  elseif self.currChallenge == self.lastChallenge then -- If the last challenge beat was the last, return the boss
    self.bossFight = true
    return self.bossChallenge
  end

  -- Increase the challenge counter, then return the corresponding challenge
  self.currChallenge = self.currChallenge + 1
  return self.challenges[self.currChallenge - 1]
end
