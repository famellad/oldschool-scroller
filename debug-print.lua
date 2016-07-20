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
    love.writeDebug("  .quality: " .. quality)
    love.writeDebug("  .zeroSkip: " .. tostring(zeroSkip))
    --love.writeDebug("  .gotHere: " .. tostring(gotHere))
    --love.writeDebug("  .currentTick: " .. t)
    love.writeDebug("DIRECTOR VARIABLES:")
    --love.writeDebug("  dir.CD: " .. game.gs.dir.difficulty)
    --love.writeDebug("  dir.TD: " .. game.gs.dir.targetDif)
    love.writeDebug("  dir.challenge: " .. game.gs.dir.challenge.name)
    love.writeDebug("  dir.challengeStarted: " .. tostring(game.gs.dir.challenge.started))
    love.writeDebug("  dir.enemies: " .. TableLength(game.gs.dir.enemies))
    love.writeDebug("  chl.waves: " .. TableLength(game.gs.dir.challenge.waves))
    --love.writeDebug("  dir.restt: " .. math.ceil(game.gs.dir.restingTimer))
    --love.writeDebug("  dir.chalt: " .. math.ceil(game.gs.dir.challengeTimer))
    love.writeDebug("PLAYER VARIABLES:")
    --love.writeDebug("  player.L/R/U/D: " .. tostring(game.gs.player.movingLeft) .. "/" .. tostring(game.gs.player.movingRight) .. "/" .. tostring(game.gs.player.movingUp) .. "/" .. tostring(game.gs.player.movingDown))
    love.writeDebug("  player.HP: " .. math.floor(game.gs.player.hp) .. "/" .. game.gs.player.ship.mhp)
    love.writeDebug("  player.SP: " .. math.floor(game.gs.player.sp) .. "/" .. game.gs.player.ship.msp)
    love.writeDebug("  player.PP: " .. math.floor(game.gs.player.pp) .. "/" .. game.gs.player.ship.mpp)
    love.writeDebug("  player.V: " .. math.floor(game.gs.player.vx) .. ". " .. math.floor(game.gs.player.vy))
    love.writeDebug("OTHER:")
    love.writeDebug("  no. of mm elements: " .. TableLength(game.scene.optionsContainer.elements))
--    love.writeDebug("  getn(particles): " .. TableLength(game.gs.bullets))
  love.graphics.pop()
end
