Class = require "libs.hump.class"

Wave = Class{}

-- Prototypical wave class
-- This class contains the information necessary to spawn a wave of enemies
-- In a challenge, including paths, positions and quantities
function Wave:init(number, x, delay)
  self.number = number -- Number of enemies to spawn in this wave
  -- self.enemies = {}    -- Enemies in the wave
  self.x = x           -- X offset of the wave (from centre)
  self.cleared = false -- Wether the wave has been beaten
  self.delay = 0       -- How much to wait before spawning the wave
end

function Wave:spawnEnemies(enemyTable)
  if self.number == 1 then
    table.insert(enemyTable, )
  elseif self.number == 2 then

  elseif self.number == 3 then

  elseif self.number == 4 then

  elseif self.number == 5 then

  end
end

-- Here for compatibility purposes
function Wave:update(dt)

end

-- Here for compatibility purposes
function Wave:draw()

end
