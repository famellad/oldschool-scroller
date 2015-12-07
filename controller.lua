Class = require 'libs.hump.class'

Controller = Class{}

function Controller:init()

end

function Controller.handleInput (player)
  -- Player Movement
  if love.keyboard.isDown('a') then
    player.movingLeft = true
  elseif love.keyboard.isDown('d') then
    player.movingRight = true
  else
    player.movingLeft = false
    player.movingRight = false
  end
  if love.keyboard.isDown('w') then
    player.movingUp = true
  elseif love.keyboard.isDown('s') then
    player.movingDown = true
  else
    player.movingUp = false
    player.movingDown = false
  end

  -- Weapons
  if love.keyboard.isDown(--[[' ', 'rctrl', 'lctrl', 'ctrl', ]]'down') then
    player:triggerWeapon("all")
  elseif love.keyboard.isDown('up') then
    player:triggerWeapon("front")
  elseif love.keyboard.isDown('left') then
    player:triggerWeapon("left")
  elseif love.keyboard.isDown("right") then
    player:triggerWeapon("right")
  end

  -- Exit the thin when scape is pressed
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end
end

-- Handle presses that DO NOT repeat, via events
function love.keypressed(key, isrepeat)
  if key == 'o' then
    quality = quality + 1
    if quality > 3 then
      quality = 0
    end
    love.setEffects()
  elseif key == 'return' then
    game.gs:pauseUnpause()
  elseif key == 'l' then
    debug = debug + 1
    if debug > 2 then
      debug = 0
    end
  end
end
