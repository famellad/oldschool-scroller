Class = require 'libs.hump.class'

Weapon = Class{}

function Weapon:init(rx, ry, level)
  -- Mount Properties
  self.rx = rx
  self.ry = ry
  self.level = level

  -- Shooting Properties
  self.energy =0
  self.rateMax = 0.1
  self.rate = self.rateMax
  self.canShoot = true
  self.recoil = 10

  -- Misc
  self.mods = {}
end

function Weapon:update(dt)
  -- Shots
  self.rate = self.rate - (1 * dt)
  if self.rate < 0 then
    self.canShoot = true
  end
end

function Weapon:shoot(player)
  player.pp = player.pp - self.energy
  self.canShoot = false
  self.rate = self.rateMax

  player.ay = player.ay + self.recoil
end
