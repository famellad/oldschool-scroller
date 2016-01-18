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
  self.delay = delay       -- How much to wait before spawning the wave
end

function Wave:spawnEnemies(enemyTable)
  -- Handle formations and whatever
end

-- Here for compatibility purposes
function Wave:update(dt)

end

-- Here for compatibility purposes
function Wave:draw()

end
