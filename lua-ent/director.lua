Class = require 'libs.hump.class'

Director = Class{}


function Director:init(dif)
  self.difficulty = 0  -- Current Difficulty of the game
  self.targetDif = dif -- Target difficulty, must be above 0

  self.currentChallenge = 4 -- Current challenge being placed
  -- 0: Resting
  -- 1: Asteroid field
  -- 2: Scattered enemies
  -- 3: Minefield
  -- x: Wave enemies
  -- x: Boss Fight

  -- Enemy Creation Timers
  self.createEnemyTimerMax = 0.6
  self.createEnemyTimer = self.createEnemyTimerMax

  self.enemies = {} -- Array of enemies on screen

  -- Challenge Timers
  self.restingTimerMax = 10
  self.restingTimer = self.restingTimerMax
  self.challengeTimerMax = math.random(20, 30)
  self.challengeTimer = self.challengeTimerMax

  -- Difficulty Determination Timers
  self.ddTimerMax = self.createEnemyTimerMax * 1.5
  self.ddTimer = self.ddTimerMax
end

function Director:update(dt)
  -- Update and check timer...
  self.ddTimer = self.ddTimer - (1*dt)

  -- Determines difficulty
  self:determineDifficulty(dt)

  self:doChallenge(dt) -- Do whatever challenge is all the rage
  self:updateEnemies(dt) -- Update enemies on screen

  -- Reset difficulty timer
  if self.ddTimer < 0 then
    self.ddTimer = self.ddTimerMax
  end
end

-- This function will make sense when relative difficulty is added
function Director:determineDifficulty(ndif)
  if self.ddTimer < 0 then
    self.targetDif = 10 * game.gs.score + 100

    -- It loops twice here but it's once every two enemy cycles so it's fine
    self.difficulty = 0
    for i, enemy in ipairs(self.enemies) do
      self.difficulty = self.difficulty + enemy.dif
    end
  end
end

-- TODO CHECK COLLISIONS HERE
function Director:updateEnemies(dt)
  for i, enemy in ipairs(self.enemies) do
    -- Update every enemy individually
    enemy:update(dt)

    if enemy.y > height+enemy.radius then -- remove enemies out of bounds
      table.remove(self.enemies, i)
    end
  end
end

function Director:doChallenge(dt)
  if self.currentChallenge == 0 then
    self:doResting(dt)
  elseif self.currentChallenge == 1 then
    self:doChallengeAsteroids(dt)
  elseif self.currentChallenge == 2 then
    self:doChallengeScattered(dt)
  elseif self.currentChallenge == 3 then
    self:doChallengeMinefield(dt)
  elseif self.currentChallenge == 4 then
      self:doChallengeSimu1(dt)
    end

  if self.currentChallenge > 0 then
    -- Do the challenge timer
    self.challengeTimer = self.challengeTimer - (1 * dt)
    if self.challengeTimer < 0 then
      self.currentChallenge = 0
      self.challengeTimer = math.random(20, 30)
    end
  end
end

-- TODO REDO ALL OF THESE AS CLASSES

-- Challenges!!
-- Resting
function Director:doResting(dt)
  -- Do Timers
  self.restingTimer = self.restingTimer - (1 * dt)
  if self.restingTimer < 0 then
    self.restingTimer = self.restingTimerMax

    self.challengeTimerMax = math.random(20, 30)
    self.challengeTimer = self.challengeTimerMax
    self.currentChallenge = math.random(1,3)
  end
end

-- Asteroids
function Director:doChallengeAsteroids(dt)
  -- Check whether to make a new asteroid on each tick of the timer
  self.createEnemyTimer = self.createEnemyTimer - (1 * dt)
  if self.createEnemyTimer < self.createEnemyTimer / 4 and self.difficulty < self.targetDif then
    self.createEnemyTimer = self.createEnemyTimerMax

    local big = math.random(2)

    if big == 1 then
      local newEnemy = AsteroidSmall(math.random(20, width - 20), -30)
      table.insert(self.enemies, newEnemy)
    elseif big == 2 then
      local newEnemy = AsteroidMedium(math.random(20, width - 20), -30)
      table.insert(self.enemies, newEnemy)
    end


    -- Add the difficulty to this enemy
    --self:addDifficulty(newEnemy.dif)
  end
end

-- Scattered
function Director:doChallengeScattered(dt)
  -- Check whether to make a new enemy on each tick of the timer
  self.createEnemyTimer = self.createEnemyTimer - (1 * dt)
  if self.createEnemyTimer < 0 and self.difficulty < self.targetDif then
    self.createEnemyTimer = self.createEnemyTimerMax

    local newEnemy = EnemyMedium(math.random(20, width - 20), math.random(0, 10))
    table.insert(self.enemies, newEnemy)
    -- Add the difficulty to this enemy
    --self:addDifficulty(newEnemy.dif)
  end
end

-- Simushooties
function Director:doChallengeSimu1(dt)
  -- Check whether to make a new enemy on each tick of the timer
  self.createEnemyTimer = self.createEnemyTimer - (1 * dt)
  if self.createEnemyTimer < 0 and self.difficulty < self.targetDif then
    self.createEnemyTimer = self.createEnemyTimerMax

    local newEnemy = EnemySimuMed(math.random(20, width - 20), math.random(0, 10))
    table.insert(self.enemies, newEnemy)
    -- Add the difficulty to this enemy
    --self:addDifficulty(newEnemy.dif)
  end
end

-- Waves

-- Minefield
function Director:doChallengeMinefield(dt)
  -- Check whether to make a new enemy on each tick of the timer
  self.createEnemyTimer = self.createEnemyTimer - (1 * dt)
  if self.createEnemyTimer < 0 and self.difficulty < self.targetDif then
    self.createEnemyTimer = self.createEnemyTimerMax

    local n = math.random(0, 4)
    local newEnemies = {}

    if n == 1 then
      local newEnemy = EnemyMine(math.random(20, width - 20), 0)
      table.insert(newEnemies, newEnemy)
    elseif n == 2 then
      local origin = math.random(20, width - 20)
      local newEnemy1 = EnemyMine(origin, -30)
      local newEnemy2 = EnemyMine(origin, 0)
      table.insert(newEnemies, newEnemy1)
      table.insert(newEnemies, newEnemy2)
    elseif n == 3 then
      local origin = math.random(20, width - 20)
      local newEnemy1 = EnemyMine(origin - 15, 0)
      local newEnemy2 = EnemyMine(origin + 15, 0)
      table.insert(newEnemies, newEnemy1)
      table.insert(newEnemies, newEnemy2)
    else

    end

    for i, enemy in ipairs(newEnemies) do
      table.insert(self.enemies, enemy)
    end
  end
end

-- Boss Fight

function Director:addDifficulty(ddif)
  self.difficulty = self.difficulty + ddif
end

function Director:drawEnemies()
  -- Iterate through all enemies to draw them
  for i, enemy in ipairs(self.enemies) do
    enemy:draw()
  end
end

-- Implement formations!
