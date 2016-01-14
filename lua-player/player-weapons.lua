
function Player:updateWeapon (dt, i)
  -- Shots
  -- Update the rate timer to check whether the gun can fire
  self.weapons[i].rate = self.weapons[i].rate - (1 * dt)
  if self.weapons[i].rate < 0 then
    -- If the rate reaches 0, the gun is ready
    self.weapons[i].canShoot = true
  end
end

-- OBSOLETE
-- function Player:shootWeapon (dt, i)
--   -- Actually fire the bullet
--   -- First we check whether the gun CAN shoot, and then whether the player has enough energy for the shot
--   if self.weapons[i].canShoot and self.pp > self.weapons[i].ener then
--     -- A bullet is added, depending on weapon and level
--     bullets.add(self.weapons[i].kind .. self.weapons[i].level, self.x, self.y - self.h / 2)
--     -- Recoil the player
--     self.ay = self.ay + self.weapons[i].recoil
--     -- Substract the energy required
--     self.pp = self.pp - self.weapons[i].ener
--     -- Reset the fire rate timer
--     self.weapons[i].canShoot = false
--     self.weapons[i].rate = self.weapons[i].rateMax
--   end
-- end

-- Trigger a specific mount
-- TODO REDO THIS
function Player:triggerWeapon(mount)
  -- If the player has enough PP and is alive...
  if self.pp > 0 and game.gs.isAlive then
    -- Trigger all mounts
    if mount == "all" then
      local totalPP = 0 -- Temp variable to calculate the total amount of PP needed
      for i, weapon in ipairs(self.weapons) do
        totalPP = totalPP + weapon.energy -- For each weapon, add the PP needed to the total
      end
      local currPP = self.pp -- Temp value holding the current PP
      for i, weapon in ipairs(self.weapons) do
        -- If the current PP is greater than the total PP needed, fire all weapons
        if weapon.canShoot and currPP >= totalPP then
          weapon:shoot(self)
        end
      end
    elseif mount == "front" then
      -- Shoot the front mount
      if self.weapons[1].canShoot then
        self.weapons[1]:shoot(self)
      end
    elseif mount == "left" then
      -- Shoot the left mount
      if self.weapons[2].canShoot then
        self.weapons[2]:shoot(self)
      end
    elseif mount == "right" then
      -- Shoot the right mount
      if self.weapons[3].canShoot then
        self.weapons[3]:shoot(self)
      end
    end
  end
end

-- Function to mount a weapon
-- TODO REDO THIS BECAUSE IT WORKS LIKE CARP
function Player:addWeapon (kind, level, x, y)
  if kind == "hammer" then
    newWeapon = WeaponHammer(x, y, level)
  end
  table.insert(self.weapons, newWeapon)
end
