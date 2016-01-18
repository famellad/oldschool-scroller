Class = require 'libs.hump.class'

Controller = Class{}

function Controller:init()
  -- Assume no controller is attached
  self.joystickAttached = false
  self.joystick = nil

  self.js = love.joystick.getJoysticks()
  self.cJoy = self.js[1]
  --self.joystick = joysticks[0]

  self.xboxDeadzone = 0.4

  self.startPressed = false
end

function Controller:checkBindTable ()
  -- Assumes a keyboard is always attached
  self:keyboardAttached()

  -- Check whether there's a controller plugged
  -- For some reason this hotplugs as well, don't even wonder why
  if self.cJoy ~= nil then
    -- TODO Check whether it's an xbox controller
    self:xboxAttached()

    -- TODO Have a fallback class when it turns out it's not an xbox controller
    -- self:gamepadAttached()
  end
end

function Controller:handleInput (player)
  -- Handle inputs only if the console is not active
  if not console.toggled then

    -- Check which binds have been activated
    self:checkBindTable()

    -- Player Movement in the X axis
    if self.padLeft then
      player.movingLeft = true
    elseif self.padRight then
      player.movingRight = true
    else -- If no movement bind is active, assume the player is not moving
      player.movingLeft = false
      player.movingRight = false
    end
    -- Same goes for the Y axis
    if self.padUp then
      player.movingUp = true
    elseif self.padDown then
      player.movingDown = true
    else
      player.movingUp = false
      player.movingDown = false
    end

    -- Button binds, TODO REWORK ALL THESE AND COMMENT PROPERLY
    if self.butTop then
      player:triggerWeapon("all")
    elseif self.butBot then
      player:triggerWeapon("front")
    elseif love.keyboard.isDown('left') then
      player:triggerWeapon("left")
    elseif love.keyboard.isDown("right") then
      player:triggerWeapon("right")
    end

    --self:doStart()
    -- Start/select
    -- if self.butStart then
    --   self.startPressed = true
    --   self:doStart()
    -- else
    --   self.startPressed = false
    -- end
    --
    -- if self.butSelect then
    --
    -- end
  end
end

function Controller:doStart()
  if game.tmpState == 0 then
    if game.scene.state == 2 then
      game.tmpState = 1
      music.tracks.shoot:stop()
    else
      game.scene.state = game.scene.state + 1
    end
  else
    game.gs:pauseUnpause() -- TODO change this for "handleReturn"
  end
end

-- TODO Handle presses that DO NOT repeat, via events
-- TODO REWORK ALL THIS
function love.keypressed(key, isrepeat)
  if key == '`' then
    if console.toggled then
      console.toggled = false
    else
      console.toggled = true
    end
  elseif key == 'l' then
    debug = debug + 1
    if debug > 2 then
      debug = 0
    end
  end

  if not console.toggled then
    if key == 'o' then
      quality = quality + 1
      if quality then
        quality = 0
      end
      love.setEffects()
    elseif key == 'return' then
      Controller.doStart()
    elseif key == 'escape' then
      love.event.push('quit')
    end
  end
end
