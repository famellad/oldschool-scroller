guiImg = nil

powerImg = nil

function guiLoad ()
  guiImg = love.graphics.newImage('gfx/gui/gui-back.png')
  hpImg = love.graphics.newImage('gfx/gui/sb-hp.png')
  shieldImg = love.graphics.newImage('gfx/gui/sb-shield.png')
  powerImg = love.graphics.newImage('gfx/gui/sb-power.png')
end

function guiUpdate (dt)

end

function guiDraw (player)
  love.graphics.draw(guiImg, 0, 0)

  sb_hpCurr = player.hp
  for i=0,9 do
    if sb_hpCurr >= player.ship.mhp / 10 then
      love.graphics.draw(hpImg, 183, 58 - 5*i)
      sb_hpCurr = sb_hpCurr - player.ship.mhp / 10
    end
  end

  sb_shieldCurr = player.sp
  for i=0,9 do
    if sb_shieldCurr >= player.ship.msp / 10 then
      love.graphics.draw(shieldImg, 202, 58 - 5*i)
      sb_shieldCurr = sb_shieldCurr - player.ship.msp / 10
    end
  end

  sb_powerCurr = player.pp
  for i=0,9 do
    if sb_powerCurr >= player.ship.mpp / 10 then
      love.graphics.draw(powerImg, 221, 58 - 5*i)
      sb_powerCurr = sb_powerCurr - player.ship.mpp / 10
    end
  end

  if game.isAlive == false then
    love.graphics.print("Press START to try again", width/2-50, 30)
  end

  if game.paused and math.floor(t / 60) % 2 == 0 then
    love.graphics.print("GAME PAUSED", realWidth/2-50, 50)
  end
end
