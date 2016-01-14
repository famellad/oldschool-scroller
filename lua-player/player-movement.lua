function Player:handleMovement(dt)
  -- Handle Movement, X-axis
  -- First check whether the player is out of boundaries
  -- If so then they're immediately accelerated towards the centre
  if self.x < 0 then
    self.ax = self.ship.acc
  elseif self.x > width then
    self.ax = -self.ship.acc
  else
    -- If the player isn't out of bounds
    -- Check whether a movement key is pressed
    -- And if so, apply the ship acceleration to the player acceleration
    -- TODO IS THIS A FORMALITY? IT SEEMS TO BE
    if self.movingLeft then
      self.ax = -self.ship.acc
    elseif self.movingRight then
      self.ax = self.ship.acc
    end
  end

  -- Y movement is analogous
  if self.y < 0 then
    self.ay = self.ship.acc
  elseif self.y > height then
    self.ay = -self.ship.acc
  else
    if self.movingUp then
      self.ay = -self.ship.acc
    elseif self.movingDown then
      self.ay = self.ship.acc
    end
  end
end

function Player:handleMovementPost(dt)
  -- Add the acceleration to the Velocity
  -- Then check whether it is exceeding the max
  -- Velocity for the ship, and if so, clamp it
  self.vx = self.vx + (self.ax*dt)
  if math.abs(self.vx) > self.ship.maxv then
    if self.vx > 0 then
      self.vx = self.ship.maxv
    else
      self.vx = -self.ship.maxv
    end
  end
  -- Actually literally move the bloody ship
  self.x = self.x + (self.vx*dt)

  -- Y movement is analogous
  self.vy = self.vy + (self.ay*dt)
  if math.abs(self.vy) > self.ship.maxv then
    if self.vy > 0 then
      self.vy = self.ship.maxv
    else
      self.vy = -self.ship.maxv
    end
  end
  self.y = self.y + (self.vy*dt)

  -- This here snippet makes the ship stop COMPLETELY
  -- if it turns out to be moving too slow, (5 units/sec)
  -- This avoids some weird bugs with the dt variable
  -- When the ship is either out of bounds or the game is
  -- not running at exactly 60fps
  if math.abs(self.vx) < 5 then
    self.vx = 0
  end
  if math.abs(self.vy) < 5 then
    self.vy = 0
  end
end

function Player:brake(dt)
  -- After moving we assume there's friction in space BECAUSE
  -- OTHERWISE this game is no fun, this is done by dampening the velocity
  -- IF THE SHIP IS NOT CURRENTLY ACCELERATING
  if self.ax == 0 then
    self.vx = self.vx * 0.89
--    if self.vx > 0 then
--      self.vx = self.vx * 0.89 --* dt * 60--- self.ship.acc*dt/2
--    elseif self.vx < 0 then
--      self.vx = self.vx * 0.89 --* dt * 60--+ self.ship.acc*dt/2
--    end
  end

  -- Y movement is analogous, yet it slows down faster, because I say so
  if self.ay == 0 then
    self.vy = self.vy * 0.87
--    if self.vy > 0 then
--      self.vy = self.vy * 0.87 --* dt * 60--- self.ship.acc*dt/3
--    elseif self.vy < 0 then
--      self.vy = self.vy * 0.87 --* dt * 60--+ self.ship.acc*dt/3
--    end
  end

  -- Acceleration is reset so we can begin anew in the next cycle and see what happens
  self.ax = 0
  self.ay = 0
end
