Class = require 'libs.hump.class'

WeaponHammer = Class{__includes=Weaon}

function WeaponHammer:init(rx, ry, level)
  -- Mount Properties
  self.rx = rx
  self.ry = ry
  self.level = level

  -- Shooting Properties
  self.energy = 4.5
  self.rateMax = 0.2 - level*0.02
  self.rate = self.rateMax
  self.canShoot = true
  self.recoil = 100

  -- Misc
  self.mods = {}
end

function WeaponHammer:update(dt)
  Weapon.update(self, dt)
end

function WeaponHammer:shoot(player)
  -- Call the parent function
  Weapon.shoot(self, player)

  -- Create Bullit
  newBullet = BulletHammer(player.x + self.rx, player.y + self.ry, self.level, true)

  -- Play a sound upon shooting
  TEsound.play("sfx/hit.ogg", "", 0.8, math.random(9, 11) / 10)

  -- Finally add a bullet to the bullet array
  game.gs.bullets:addBullet(newBullet)
end
