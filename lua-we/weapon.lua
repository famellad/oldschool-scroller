Class = require 'libs.hump.class'

Weapon = Class{}

function Weapon:init(rx, ry, level)
  -- Mount Properties
  self.rx = rx       -- X displacement
  self.ry = ry       -- Y displacement
  self.level = level -- The level of the weapon

  -- Shooting Properties
  self.energy =0           -- How much PP it consumes
  self.rateMax = 0.1       -- How fast can it fire (in seconds)
  self.rate = self.rateMax -- Temp variale to control firing
  self.canShoot = true     -- Can it currently shoot?
  self.recoil = 10         -- The recoil of the gun TODO THIS IS NOT WORKING???

  -- Misc
  self.mods = {} -- Applied modifications
end

function Weapon:update(dt)
  -- Shots
  self.rate = self.rate - (1 * dt)
  if self.rate < 0 then
    self.canShoot = true
  end
end

function Weapon:shoot(player)
  -- When fired, remove the PP from the player
  -- Set it to be unable to shoot again (immediately after at least)
  -- And add the recoil that doesn't work TODO
  player.pp = player.pp - self.energy
  self.canShoot = false
  self.rate = self.rateMax

  player.ay = player.ay + self.recoil
end
