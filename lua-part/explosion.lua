explosions = {}
--
-- expHitImg = nil
-- expMediumImg = nil
--
-- function explosions.load ()
--   expHitImg = love.graphics.newImage('gfx/parts/small-impact.png')
--   expMediumImg = love.graphics.newImage('gfx/parts/explosion.png')
-- end
--
-- function explosions.add (t, x, y)
--   if t == "hit" then
--     frames = 3
--     newAnim = newAnimation(expHitImg, 7, 7, 0.1, frames)
--     TEsound.play("sfx/hit.ogg", "", 0.8, math.random(10, 12) / 10)
--   elseif t == "medium" then
--     frames = 12
--     newAnim = newAnimation(expMediumImg, 32, 32, 0.05, 0)
--     newAnim.setMode("once")
--     TEsound.play("sfx/explosion-med.ogg", "", 0.8, math.random(8, 11) / 10)
--   end
--
--   newExplosion = {anim = newAnim, frames = frames, c = 0, x = x, y = y}
--   table.insert(explosions, newExplosion)
-- end
--
function explosions.update (dt)
  for i, exp in ipairs(explosions) do
    exp:update(dt, i)
  end
end

function explosions.draw ()
  for i, exp in ipairs(explosions) do
    exp:draw()
  end
end

Class = require 'libs.hump.class'

Explosion = Class{}

function Explosion:init(x, y)
  self.x = x
  self.y = y

  self.frames = 1
  self.frame = 0

  self.w = 2
  self.h = 2

  self.anim = newAnimation(love.graphics.newImage('gfx/nul.png'), 2, 2, 0.1, 0)

  table.insert(explosions, self)
end

function Explosion:update(dt, i)
  self.frame = self.frame + 10 * dt
  self.anim:update(dt)

  if self.frame > self.frames then
    table.remove(explosions, i)
  end
end

function Explosion:draw()
  local nx = math.floor(self.x - self.w / 2)
  local ny = math.floor(self.y - self.h / 2)

  self.anim:draw(nx, ny)
end
