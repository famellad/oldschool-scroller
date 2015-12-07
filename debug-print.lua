-- Current line for debug display
currentDebugLine = 1

function love.writeDebug(text)
  love.graphics.print(text, 6, line(currentDebugLine))
  currentDebugLine = currentDebugLine + 1
end

function line (i)
  return 6 * (2 * i - 1)
end

function love.printDebug()
  love.graphics.push()
    love.graphics.scale(1)
    currentDebugLine = 1
    love.writeDebug(version)
    love.writeDebug("")
    love.writeDebug("LOVE VARIABLES:")
    love.writeDebug("  timer.FPS: " .. love.timer.getFPS())
    love.writeDebug("DIRECTOR VARIABLES:")
    love.writeDebug("  dir.CD: " .. game.dir.difficulty)
    love.writeDebug("  dir.TD: " .. game.dir.targetDif)
    love.writeDebug("  dir.challenge: " .. game.dir.currentChallenge)
    love.writeDebug("  dir.restt: " .. math.ceil(game.dir.restingTimer))
    love.writeDebug("  dir.chalt: " .. math.ceil(game.dir.challengeTimer))
    love.writeDebug("PLAYER VARIABLES:")
    --love.writeDebug("  player.L/R/U/D: " .. tostring(game.player.movingLeft) .. "/" .. tostring(game.player.movingRight) .. "/" .. tostring(game.player.movingUp) .. "/" .. tostring(game.player.movingDown))
    love.writeDebug("  player.HP: " .. math.floor(game.player.hp) .. "/" .. game.player.ship.mhp)
    love.writeDebug("  player.SP: " .. math.floor(game.player.sp) .. "/" .. game.player.ship.msp)
    love.writeDebug("  player.PP: " .. math.floor(game.player.pp) .. "/" .. game.player.ship.mpp)
    love.writeDebug("  player.V: " .. math.floor(game.player.vx) .. ". " .. math.floor(game.player.vy))
    love.writeDebug("OTHER:")
    love.writeDebug("  getn(particles): " .. tableLength(game.bullets))
  love.graphics.pop()
end
