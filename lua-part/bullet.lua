-- bullet table, all bullets
--bullets = {}
bulletImgs = {}

function bulletImgs.load()
  bulletImgs.hammer0Img = love.graphics.newImage('gfx/pews/hammer0.png')
  bulletImgs.hammer1Img = love.graphics.newImage('gfx/pews/hammer1.png')
  bulletImgs.hammer2Img = love.graphics.newImage('gfx/pews/hammer2.png')

  bulletImgs.spread0Img = love.graphics.newImage('gfx/pews/spread0.png')
  -- spread1
  -- spread2

  bulletImgs.gauss0Img = love.graphics.newImage('gfx/pews/gauss0.png')
  bulletImgs.gauss1Img = love.graphics.newImage('gfx/pews/gauss1.png')
  bulletImgs.gauss2Img = love.graphics.newImage('gfx/pews/gauss2.png')

  bulletImgs.machineImg = love.graphics.newImage('gfx/pews/machine.png')
end

-- function bullets.update(dt)
--   for i, bullet in ipairs(bullets) do
--     bullet.x = bullet.x + (bullet.vx * dt)
--     bullet.y = bullet.y - (bullet.vy * dt)
--
--     if bullet.y < -30 then --remove bullets
--       table.remove(bullet, i)
--     end
--   end
-- end

-- function bullets.draw(dt)
--   for i, bullet in ipairs(bullets) do
--     love.graphics.draw(bullet.img, bullet.x - 3, bullet.y - 2)
--   end
-- end

-- function bullets.add (kind, sx, sy)
--   if kind == "hammer0" then
--     bullets.newBullet(sx, sy, math.random(-8, 8), 150, 5, bulletImgs.hammer0Img)
--   elseif kind == "hammer1" then
--     bullets.newBullet(sx, sy, math.random(-8, 8), 180, 7.5, bulletImgs.hammer1Img)
--   elseif kind == "hammer2" then
--     bullets.newBullet(sx, sy, math.random(-8, 8), 210, 10, bulletImgs.hammer2Img)
--
--   elseif kind == "gauss0" then
--     bullets.newBullet(sx, sy, 0, 500, 12, bulletImgs.gauss0Img)
--   elseif kind == "gauss1" then
--     bullets.newBullet(sx, sy, 0, 650, 18, bulletImgs.gauss1Img)
--   elseif kind == "gauss2" then
--     bullets.newBullet(sx, sy, 0, 800, 24, bulletImgs.gauss2Img)
--
--   elseif kind == "machine0" then
--     bullets.newBullet(sx, sy, math.random(-6, 6), 300, 1.15, bulletImgs.machineImg)
--   elseif kind == "machine1" then
--     bullets.newBullet(sx, sy, math.random(-3, 3), 300, 1.725, bulletImgs.machineImg)
--   elseif kind == "machine2" then
--     bullets.newBullet(sx, sy, 0, 300, 2.3, bulletImgs.machineImg)
-- , level(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--   elseif kind == "spread1" then
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--   elseif kind == "spread2" then
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--     bullets.newBullet(sx, sy + math.random(-3, 2), math.random(-30, 30), 100 + math.ra, level-3, 2), math.random(-30, 30), 100 + math.random(-15, 15), 2, bulletImgs.spread0Img)
--   end
-- end
--
-- function bullets.newBullet(sx, sy, bvx, bvy, bdam, bimg)
--   local newBullet = {x = sx,
--                y = sy,
--                vx = bvx,
--                vy = bvy,
--                dam = bdam,
--                img = bimg}
--   table.insert(bullets, newBullet)
-- end

------------------------------------------------
-- EVERYTHING ABOVE THIS LINE MUST BE REVISED
-- AND TRIMMED, PLEASE

Class = require 'libs.hump.class'

Bullet = Class{}

function Bullet:init(x, y, level, goUp)
  -- Positions and speed
  self.x = x
  self.y = y
  self.vx = 0
  self.vy = 1

  -- Dimensions
  self.w = 1
  self.h = 1

  -- Damage!
  self.level = level
  self.dam = 0

  -- Bullet model
  self.img = nil

  -- Whether the bullet is going up or not
  self.goUp = goUp
  self:flip()
end

function Bullet:flip()
  if self.goUp then
    self.vy = -1 * self.vy
  end
end

function Bullet:update(dt)
  -- Move it
  self.y = self.y + self.vy * dt
  self.x = self.x + self.vx * dt
end

function Bullet:draw()

  -- Draw particle from center rather than origin
  -- (Lines up with point-circle collission detection)
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  -- Rotate the bullet depending on orientation
  if self.goUp then
    love.graphics.draw(self.img, nx, ny)
  else
    love.graphics.draw(self.img, nx + self.w, ny + self.h, 3.141592)
  end


  if debug >= 2 then
    love.graphics.setColor(255, 200, 0, 255)
    love.graphics.circle("line", self.x, self.y, 2, 8)
    love.graphics.setColor(255, 255, 255, 255)
  end
end
