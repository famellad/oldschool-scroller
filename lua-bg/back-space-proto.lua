Class = require 'libs.hump.class'

BackSpaceProto = Class{__includes = Background}

-- Prototypical Space background to encompass all backgrounds that happen to occur in space
function BackSpaceProto:init()
  Background.init(self)

  -- Star sprites
  -- TODO replace these for star CLUSTER sprites.. maybe
  self.starImg = {
    small = love.graphics.newImage("gfx/back/star-small.png"),
    med   = love.graphics.newImage("gfx/back/star-med.png"),
    big   = love.graphics.newImage("gfx/back/star-big.png")
  }

  -- Create a list to hold all the stars
  self.stars = {}
  -- How often do we get a star?
  self.createStarTimerMax = 0.6
  -- Timer for new stars
  self.createStarTimer = self.createStarTimerMax
end

function BackSpaceProto:update(dt)
  -- Update parent
  Background.update(self, dt)
  -- Advance the star timer
  self.createStarTimer = self.createStarTimer - 1 * dt

  -- If it is time to create a star...
  if self.createStarTimer <= 0 then
    -- We create a tmp variable to hold the new star
    local tmpImg = nil
    -- Number, 0-9
    local r = math.random(0, 10)

    if r == 0 then
      -- 10% chance to be a big star
      tmpImg = self.starImg.big
    elseif r <= 4 then
      -- 40% chance to be a regular star
      tmpImg = self.starImg.med
    else
      -- 50% chance to be a small star
      tmpImg = self.starImg.small
    end

    -- Determine the z-distance of the star, for parallax effects
    local nz = math.random(3) + 2
    -- The vertical velocity of the star is determined by the z-distance
    local nvy = 6 * nz

    -- The new star struct is created with all the info we've just obtained/created
    -- It is then added into the list, and finally the counter is reset, for a new star to be created somewhere in the near future :)
    local newStar = {x = math.random(0, width), y = -5, vy = nvy, z = nz , img = tmpImg}
    table.insert(self.stars, newStar)
    self.createStarTimer = self.createStarTimerMax
  end

  for i, star in ipairs(self.stars) do
    star.y = star.y + star.vy * dt
    --star.x = star.x - player.x / (15 - star.z * 15)
    if star.y > height then
      table.remove(self.stars, i)
    end
  end
end

function BackSpaceProto:draw()
  Background.draw(self)

  -- All stars are drawn sequentially AFTER the background
  for i, star in ipairs(self.stars) do
    love.graphics.draw(star.img, math.floor(width - game.gs.player.x * (6 - star.z) / 50 - (star.x)), math.floor(star.y))
  end
end
