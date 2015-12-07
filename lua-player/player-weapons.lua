
function Player:updateWeapon (dt, i)
  -- Shots
  self.weapons[i].rate = self.weapons[i].rate - (1 * dt)
  if self.weapons[i].rate < 0 then
    self.weapons[i].canShoot = true
  end
end

function Player:shootWeapon (dt, i)
  -- Create Bullit
  if self.weapons[i].canShoot and self.pp > self.weapons[i].ener then
    bullets.add(self.weapons[i].kind .. self.weapons[i].level, self.x, self.y - self.h / 2)
    self.ay = self.ay + self.weapons[i].recoil
    self.pp = self.pp - self.weapons[i].ener
    self.weapons[i].canShoot = false
    self.weapons[i].rate = self.weapons[i].rateMax
  end
end

function Player:addWeapon (kind, level, x, y)
  if kind == "hammer" then
    newWeapon = WeaponHammer(x, y, level)
  -- elseif kind == "gauss" then
  --   self:newWeapon(kind, 10, 0.55, level, 1500)
  -- elseif kind == "spread" then
  --   self:newWeapon(kind, 7, 0.35, level, 200)
  -- elseif kind == "machine" then
  --   self:newWeapon(kind, 1.1, 0.06, level, 0)
  end
  table.insert(self.weapons, newWeapon)
end
