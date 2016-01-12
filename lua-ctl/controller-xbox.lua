function Controller:xboxAttached()
  -- D-Pad
  self.padLeft = self.padLeft or self.cJoy:isGamepadDown('dpleft')
  self.padRight = self.padRight or self.cJoy:isGamepadDown('dpright')
  self.padUp = self.padUp or self.cJoy:isGamepadDown('dpup')
  self.padDown = self.padDown or self.cJoy:isGamepadDown('dpdown')

  -- Buttons
  self.butBottom = self.butBottom or self.cJoy:isGamepadDown('a')
  self.butRight = self.butRight or self.cJoy:isGamepadDown('b')
  self.butLeft = self.butLeft or self.cJoy:isGamepadDown('x')
  self.butTop = self.butTop or self.cJoy:isGamepadDown('y')
  --Shoulders
  -- TODO left shoulder
  -- TODO left trigger (as shoulder)
  -- TODO right shoulder
  -- TODO right trigger (as shoulder)

  -- Left analog
  -- TODO handle axes deadzones

  -- Start/Select
  -- TODO start
  -- TODO select

  -- Not sure what to do with the right analog and the stick buttons
end
