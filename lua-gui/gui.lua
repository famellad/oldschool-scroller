guiImg = nil

powerImg = nil

-- TODO REDO ALL THIS AS A CLASS
function guiLoad ()
  guiImg = love.graphics.newImage('gfx/gui/gui-back.png')
  hpImg = love.graphics.newImage('gfx/gui/sb-hp.png')
  shieldImg = love.graphics.newImage('gfx/gui/sb-shield.png')
  powerImg = love.graphics.newImage('gfx/gui/sb-power.png')
end

function guiUpdate (dt)

end

function guiDraw (player)
  -- Draw the backdrop for the GUI
  love.graphics.draw(guiImg, 0, 0)

  -- All following procedures are analogous to this one
  sb_hpCurr = player.hp -- Get the player current HP in a temporal variable
  for i=0,9 do -- For each bead thing that is going to be drawn, iterate
    if sb_hpCurr >= player.ship.mhp / 10 then -- While the temporal variable is higher than the max HP divided by the number of beads, continue
      love.graphics.draw(hpImg, 183, 58 - 5*i) -- Draw a bead if it passes the test
      sb_hpCurr = sb_hpCurr - player.ship.mhp / 10 -- Substract a tenth of the maximum HP to the temporal variable, repeat
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

  -- Display the PRESS START text when DEAD
  if game.gs.isAlive == false then
    love.graphics.print("Press START to try again", width/2-50, 30)
  end

  -- Display the GAME PAUSED text when paused
  if game.gs.paused and math.floor(t / 60) % 2 == 0 then
    love.graphics.print("GAME PAUSED", realWidth/2-50, 50)
  end
end
