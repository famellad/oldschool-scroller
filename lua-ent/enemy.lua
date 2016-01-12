Class = require 'libs.hump.class'

Enemy = Class{__includes = Entity}

function Enemy:init()
  self.hp = 1  -- Current HP
  self.sp = 0  -- Current Shield
  self.mhp = 1 -- Maximum HP
  self.msp = 0 -- Maximum Shield
  self.dif = 0 -- Difficulty of enemy
  self.radius = 0 -- Radius for collision
end

function Enemy:update(dt)
  -- Do AI pass, this is custom per enemy of course
  self:doAI(dt)

  -- Move the enemy according to its velocities
  self.x = self.x + self.vx*dt
  self.y = self.y + self.vy*dt
end

function Enemy:draw()
  -- Draw debug info lv2
  if debug >= 2 then
    -- Draw the bounding box
    love.graphics.setColor(255, 40, 0, 255)
    love.graphics.circle("line", self.x, self.y, self.radius, 16)
    love.graphics.setColor(255, 255, 255, 255)

    -- Draw the health bar
    love.graphics.setColor(0, 255, 0, 255)
    local len = 27 * (self.hp / self.mhp)
    love.graphics.line(self.x, self.y + 20, self.x + len, self.y + 20)

    -- Reset to white tinting
    love.graphics.setColor(255, 255, 255, 255)
  end
end

-- AI loop, unused for the prototype enemy
function Enemy:doAI(dt)

end

function Enemy:damage(damage)
  -- 90% of the damage is absorbed by the shield
  self.sp = self.sp - (9 * damage / 10)

  -- If this happens to destroy the shield... (making it a negative value)
  if self.sp < 0 then
    -- The remaining damage should be substracted to the hp
    self.hp = self.hp + self.sp
    -- The shield is then set to 0
    self.sp = 0
  end

  -- The remaining 10% of the damage is then passed to the hp
  self.hp = self.hp - (damage / 10)

  -- If the hp of a ship drops below 0, it must be destroyed
  if self.hp <= 0 then
    self:destroy()
  end
end

-- Function unused because the difficulty loop seems to do the trick and this doesn't
function Enemy:removeDifficulty()
  dir.difficulty = dir.difficulty - self.dif
end

-- Called when the enemy runs out of health
-- The argument is whether there is a chance to spawn a powerup
function Enemy:destroy(doPowerup)
  if doPowerup then
    -- Call the game function for a chance to win a shiny powerup!
    game.gs:chancePowerup(self.x, self.y)
  end

  -- Not actually destroy, but rather move out of bounds, where it shall be eliminated
  -- This works better than removing it, since things get funky when you modify a list
  -- You're iterating through
  self.y = 1000
end
