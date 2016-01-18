Class = require "libs.hump.class"

ChallengeSimuMed = Class{__includes = Challenge}

-- This is the standard collection of enemies seen in the
-- Simulation, they come in packs
function ChallengeSimuMed:init(wavesNumber, waveSize)
  Challenge.init(self)

  self.name = "SimuMed"

  self.wavesNumber = wavesNumber
  self.waveSize = waveSize

-- FIXME!!!!
  self.completionThreshold = 15 * wavesNumber * waveSize * 0.75 -- 75% of all enemies

  self:makeWaves()
end

function ChallengeSimuMed:makeWaves()
  for i =1, self.wavesNumber do
    table.insert(self.waves, WaveSimuMed(self.waveSize, width / 2, 0 + 50 * i))
  end
end

function ChallengeSimuMed:spawnWaves(enemyTable)
  for i, wave in ipairs(self.waves) do
    wave:spawnEnemies(enemyTable)
  end
end
