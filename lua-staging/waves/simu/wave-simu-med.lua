Class = require "libs.hump.class"

WaveSimuMed = Class{__includes = Wave}

-- Wave of SimuMed Enemies
-- This class contains the information necessary to spawn a wave of enemies
-- In a challenge, including paths, positions and quantities
function WaveSimuMed:init(number, x, delay)
  Wave.init(self, number, x, delay)
end

function WaveSimuMed:spawnEnemies(enemyTable)
  local normDelay = self.delay -- Make this relative to the velocity of the enemy
  if self.number == 1 then
    -- 1
    table.insert(enemyTable, EnemySimuMed(self.x, 0 + normDelay))
  elseif self.number == 2 then
    -- 1  2
  elseif self.number == 3 then
    -- 2     3
    --    1
  elseif self.number == 4 then
    -- 1     3
    --    2     4
  elseif self.number == 5 then
    --   3       5
    -- 2     1     4
  end
end
