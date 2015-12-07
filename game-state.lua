Class = require 'libs.hump.class'

GameState = Class{}

-- This class will hold all the information regarding a session
-- And will be the one to get serialized
function GameState:init ()
  -- Gameplay variables
  self.paused = false  -- Whether the game is paused
  self.isAlive = true  -- Whether the player is alive
  self.score = 0       -- Scoreboard

  -- Load everything required for a new game
  -- Create the player entity and give'im a gun
  self.player = Player()
  self.player:addWeapon("hammer", 1, 0, -10)
  self.player:addWeapon("hammer", 0, -8, -6)
  self.player:addWeapon("hammer", 0, 8, -6)
  -- Load bullit
  self.bullets = BulletSystem()
  self.badBullets = BulletSystem()
  bulletImgs.load()

  -- List for powerups
  self.powerups = {}

  -- Load director
  self.dir = Director(100)

  -- Load background
  self.back = Background.getNew()

  -- Load gui
  guiLoad()
end

-- GameState also controls the actual gameplay, as it embodies the game Itself
function GameState:update(dt)
  if self.paused == false then
    -- Update the player
    if self.isAlive then
      self.player:update(dt)
    else
      dt = dt * 0.3
    end

    Controller.handleInput(self.player)

    -- Create enemies and then update them
    self.dir:update(dt)

    for i, powerup in ipairs(self.powerups) do
      powerup:update(dt)
      if powerup.x > height + 30 then
        table.remove(self.powerups, i)
      end
    end

    -- Update all bullets
    self.bullets:update(dt)
    self.badBullets:update(dt)

    -- Update all particles
    explosions.update(dt)

    -- Do a collision detection run
    self:detectCollisions()

    -- Update background
    self.back:update(dt)
  end
end

-- A gamestate contains everything that should be drawn
function GameState:draw()
  self.back:draw()

  self.player:draw()

  for i, powerup in ipairs(self.powerups) do
    powerup:draw()
  end

  self.bullets:draw()
  self.badBullets:draw()

  self.dir:drawEnemies()

  explosions.draw()

  love.graphics.print("Score: " .. self.score, 3, 3)

  guiDraw(self.player)
end

-- Function to save the current gamestate
function GameState:save(path)

end

-- Function to load the gamestate from path into the current gamestate
function GameState:load(path)

end

-- Function to detect collisions, bullets and enemies, enemies and the player
function GameState:detectCollisions ()
  -- First we iterate through all enemies
  for i, enemy in ipairs(self.dir.enemies) do
    -- Then we first iterate through all bullets, then compare with the player
    for j, bullet in ipairs(self.bullets.bullets) do
      if PointCircleCollision(enemy.x, enemy.y, enemy.radius, bullet.x, bullet.y) then
        -- Add a hit explosion if a bullet hits an enemy
        -- The explosion is autoadded to the list... this expression looks superweird but it works
        ExplosionHit(bullet.x, bullet.y)
        -- Remove the bullet and damage the enemy
        enemy:damage(bullet.dam)
        if bullet.dam < 12 then
          table.remove(self.bullets.bullets, j)
        else
          bullet.dam = bullet.dam / 2
        end
      end
    end

    if CircleCircleCollision(enemy.x, enemy.y, enemy.radius, self.player.x, self.player.y, self.player.ship.radius) and self.isAlive then
      enemy:destroy()
      self.player:damage(enemy.mhp)
    end
  end

  for i, bullet in ipairs(self.badBullets.bullets) do
    if PointCircleCollision(self.player.x, self.player.y, self.player.ship.radius, bullet.x, bullet.y) and self.isAlive then
      self.player:damage(bullet.dam)

      -- Add a hit explosion if a bullet hits an enemy
      ExplosionHit(bullet.x, bullet.y)

      table.remove(self.badBullets.bullets, i)
    end
  end

  for i, powerup in ipairs(self.powerups) do
    if CircleCircleCollision(powerup.x, powerup.y, powerup.radius, self.player.x, self.player.y, self.player.ship.radius) and self.isAlive then
      powerup:effect(self.player)
    end
  end
end

function GameState:addScore(n)
  self.score = self.score + 1
end

function GameState:pauseUnpause()
  -- Reset the score and the isAlive value
  if self.isAlive == false then
    TEsound.stop("dead")
    music.tracks.feathers:play()
    self.isAlive = true
    self.score = 0

    self.player:reset()

    -- Remove all enemies (WHY DOESN'T THIS WORK!!!!)
    for i, enemy in ipairs(self.dir.enemies) do
      enemy.x = -100
      enemy.y = 400
    end
  else
    if self.paused then
      self.paused = false
    else
      self.paused = true
    end
  end
end

function GameState:chancePowerup(x, y)
  local rand = math.random(0, 100)
  if rand < 4 then
    local newPowerup = self:returnBigPowerup(x, y)
    table.insert(self.powerups, newPowerup)
  elseif rand < 18 then
    local newPowerup = self:returnSmallPowerup(x, y)
    table.insert(self.powerups, newPowerup)
  end
end

function GameState:returnSmallPowerup(x, y)
  local newPowerup = nil
  local n = math.random(3)
  if n == 1 then
    return PowerupHP(x, y)
  elseif n == 2 then
    return PowerupSP(x, y)
  elseif n == 3 then
    return PowerupPP(x, y)
  end
end

function GameState:returnBigPowerup(x, y)
  local newPowerup = nil
  local n = math.random(3)
  if n == 1 then
    return PowerupHPFull(x, y)
  elseif n == 2 then
    return PowerupSPFull(x, y)
  elseif n == 3 then
    return PowerupPPFull(x, y)
  end
end
