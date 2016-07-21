function Controller:xboxAttached()
  -- D-Pad
  self.padLeft = self.padLeft or self.cJoy:isGamepadDown('dpleft')
  self.padRight = self.padRight or self.cJoy:isGamepadDown('dpright')
  self.padUp = self.padUp or self.cJoy:isGamepadDown('dpup')
  self.padDown = self.padDown or self.cJoy:isGamepadDown('dpdown')

  -- Buttons
  self.butBot = self.butBot or self.cJoy:isGamepadDown('a')
  self.butRight = self.butRight or self.cJoy:isGamepadDown('b')
  self.butLeft = self.butLeft or self.cJoy:isGamepadDown('x')
  self.butTop = self.butTop or self.cJoy:isGamepadDown('y')
  --Shoulders
  -- TODO left shoulder
  -- TODO left trigger (as shoulder)
  -- TODO right shoulder
  -- TODO right trigger (as shoulder)

  -- Left analog
  if self.cJoy:getAxis(1) < -self.xboxDeadzone then
    self.padLeft = true
  elseif self.cJoy:getAxis(1) > self.xboxDeadzone then
    self.padRight = true
  end

  if self.cJoy:getAxis(2) < -self.xboxDeadzone then
    self.padUp = true
  elseif self.cJoy:getAxis(2) > self.xboxDeadzone then
    self.padDown = true
  end

  -- Start/Select
  self.butStart = self.butStart or self.cJoy:isGamepadDown('start')
  self.butSelect = self.butSelect or self.cJoy:isGamepadDown('back')

  -- Not sure what to do with the right analog and the stick buttons
end

-- function love.gamepadpressed(joystick, button)
--   if button == 'start' then
--     Controller.doStart()
--   end
-- end
