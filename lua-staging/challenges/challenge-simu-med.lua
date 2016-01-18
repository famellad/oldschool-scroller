Class = require "libs.hump.class"

ChallengeSimuMed = Class{__includes = Challenge}

-- This is the standard collection of enemies seen in the
-- Simulation, they come in packs
function ChallengeSimuMed:init(waves, waveSize)
  Challenge.init(self)

  self.name = "SimuMed"

  self.waves = waves
  self.waveSize = waveSize

  self.completionThreshold = EnemySimuMed.score * waves * waveSize * 0.75 -- 75% of all enemies
end
