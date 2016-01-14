-- Control calls handled by the Controller class
-- function Player:move(direction)
--   self.moving = true
--   if direction == "left" then
--     self.ax = -self.ship.acc
--   elseif direction == "right" then
--     self.ax = self.ship.acc
--   elseif direction == "up" then
--     self.ay = -self.ship.acc
--   elseif direction == "down" then
--     self.ay = self.ship.acc
--   end
-- end

function Player:handleMovement(dt)
  -- Handle Movement, X-axis
  -- First check whether the player is out of boundaries
  -- If so then they're immediately accelerated towards the centre
  if self.x < 0 then
    self.ax = self.ship.acc
  elseif self.x > width then
    self.ax = -self.ship.acc
  else
    if self.movingLeft then
      self.ax = -self.ship.acc
    elseif self.movingRight then
      self.ax = self.ship.acc
    end
  end

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

  self.vy = self.vy + (self.ay*dt)
  if math.abs(self.vy) > self.ship.maxv then
    if self.vy > 0 then
      self.vy = self.ship.maxv
    else
      self.vy = -self.ship.maxv
    end
  end
  self.y = self.y + (self.vy*dt)

  if math.abs(self.vx) < 5 then
    self.vx = 0
  end
  if math.abs(self.vy) < 5 then
    self.vy = 0
  end
end

function Player:brake(dt)
  if self.ax == 0 then
    if self.vx > 0 then
      self.vx = self.vx * 0.89 --* dt * 60--- self.ship.acc*dt/2
    elseif self.vx < 0 then
      self.vx = self.vx * 0.89 --* dt * 60--+ self.ship.acc*dt/2
    end
  end

  if self.ay == 0 then
    if self.vy > 0 then
      self.vy = self.vy * 0.87 --* dt * 60--- self.ship.acc*dt/3
    elseif self.vy < 0 then
      self.vy = self.vy * 0.87 --* dt * 60--+ self.ship.acc*dt/3
    end
  end

  self.ax = 0
  self.ay = 0
end
