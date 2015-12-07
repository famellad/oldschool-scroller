Class = require 'libs.hump.class'

BackSpaceProto = Class{__includes = Background}

function BackSpaceProto:init()
  Background.init(self)
  self.starImg = {
    small = love.graphics.newImage("gfx/back/star-small.png"),
    med   = love.graphics.newImage("gfx/back/star-med.png"),
    big   = love.graphics.newImage("gfx/back/star-big.png")
  }
  self.stars = {}
  self.createStarTimerMax = 0.6
  self.createStarTimer = self.createStarTimerMax
end

function BackSpaceProto:update(dt)
  Background.update(self, dt)
  self.createStarTimer = self.createStarTimer - 1 * dt
  if self.createStarTimer <= 0 then
    local tmpImg = nil
    local r = math.random(0, 10)

    if r == 0 then
      tmpImg = self.starImg.big
    elseif r <= 4 then
      tmpImg = self.starImg.med
    else
      tmpImg = self.starImg.small
    end

    local nz = math.random(3) + 2
    local nvy = 6 * nz

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
  for i, star in ipairs(self.stars) do
    --self.x = width - game.player.x * self.vx - 200

    love.graphics.draw(star.img, math.floor(width - game.gs.player.x * (6 - star.z) / 50 - (star.x)), math.floor(star.y))
  end
end
