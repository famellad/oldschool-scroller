function Controller:keyboardAttached()
  -- Emulate D-Pad
  self.padLeft = love.keyboard.isDown('a')  -- Left
  self.padRight = love.keyboard.isDown('d') -- Right
  self.padUp = love.keyboard.isDown('w')    -- Up
  self.padDown = love.keyboard.isDown('s')  -- Down

  -- Emulate Buttons
  self.butTop = love.keyboard.isDown('down')    -- A
  self.butRight = love.keyboard.isDown('right') -- B
  self.butLeft = love.keyboard.isDown('left')   -- X
  self.butBot = love.keyboard.isDown('up')      -- Y

  -- Emulate Shoulders
  -- TODO Emulate LB
  -- TODO Emulate RB

  -- Emulate Start/Select
  self.butStart = love.keyboard.isDown('return')     -- Start
  self.butSelect = love.keyboard.isDown('backspace') -- Back/Select
end
