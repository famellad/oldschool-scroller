
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
  if self.pp > 0 and game.gs.isAlive then
    if mount == "all" then
      local totalPP = 0
      for i, weapon in ipairs(self.weapons) do
        totalPP = totalPP + weapon.energy
      end
      local currPP = self.pp
      for i, weapon in ipairs(self.weapons) do
        if weapon.canShoot and currPP >= totalPP then
          weapon:shoot(self)
        end
      end
    elseif mount == "front" then
      if self.weapons[1].canShoot then
        self.weapons[1]:shoot(self)
      end
    elseif mount == "left" then
      if self.weapons[2].canShoot then
        self.weapons[2]:shoot(self)
      end
    elseif mount == "right" then
      if self.weapons[3].canShoot then
        self.weapons[3]:shoot(self)
      end
    end
  end
end

function Player:addWeapon (kind, level, x, y)
  if kind == "hammer" then
    newWeapon = WeaponHammer(x, y, level)
  end
  table.insert(self.weapons, newWeapon)
end
