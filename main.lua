require("main-deps")

version = "SSP procDev-19"

-- Used for recalculating the draw functions
prevWidth = 0

-- Quality level
quality = 0 -- FIXME SHINE WORKS DIFFERENTLY ON 0.10.0!!! CONTACT THE AUTHOR!!

-- Level of debug information displayed
debug = 0

-- Current Game tick
t = 0

function love.load(arg)
  math.randomseed( os.time() )

  -- Get me a console
  console = Console()

  -- Gimme that snes look
  love.graphics.setDefaultFilter('linear', 'nearest', 0)
  love.mouse.setVisible(false)
  canvas = love.graphics.newCanvas(realwidth, height)

  -- Load Fonts
  fonts = Fonts()
  love.graphics.setFont(fonts.fatHammer)

  music = Music()
  sound = Sound()

  -- Loads a new Game object, this controls the Gameplay
  -- Itself!
  game = Game()

  -- Do post processing!
  love.setEffects()

  reflection = love.graphics.newImage('gfx/env/reflection.png')--do this as an object, for the tv and the reflection
end

-- Tick update function
function love.update(dt)
  game:update(dt)

  console:update(dt)

  TEsound.cleanup()

  -- Reset post effects on window resize
  if love.graphics.getWidth() ~= prevWidth then
    love.setEffects()
    prevWidth = love.graphics.getWidth()
    scale = love.graphics.getHeight() / height
  end

  if t % 113 == 0 then
    math.randomseed( os.time() )
  end

  t = t+1 -- Tick done!
  gdt = dt
end

function love.setEffects()
  --[[local fg = shine.filmgrain()
    fg.opacity = 0.08
    fg.grainsize = 6
  local crt = shine.crt()
  --sl = shine.scanlines()
  --sl.pixel_size = 2*love.window.getHeight() / height
  local bb = shine.boxblur()
    bb.radius = 1
  local sc = shine.separate_chroma()
    sc.angle = 0.525
    sc.radius = 2
  local gl = shine.glowsimple()
    gl.sigma = 4
    gl.min_luma = 0.95

  if quality == 1 then
    post_effect = sc:chain(crt)
  elseif quality == 2 then
    post_effect = sc:chain(crt):chain(fg)
  elseif quality == 3 then
    post_effect = sc:chain(crt):chain(fg):chain(bb)
  elseif quality == 4 then
    post_effect = sc:chain(crt):chain(fg):chain(bb):chain(gl)
  end]]
end

function love.pushPopDrawCanvas()
  local pw = (prevWidth - realWidth*scale * 8/7) / 2

  love.graphics.push()
    love.graphics.translate(pw, 0)
    love.graphics.scale(scale * 8 / 7, scale)

    love.graphics.draw(canvas, 0, 0)
  love.graphics.pop()

  love.graphics.setColor(25, 25, 26, 255)
  love.graphics.rectangle("fill", 0, 0, pw, height * scale)
  love.graphics.rectangle("fill", realWidth * scale * 8/7 + pw, 0, pw, height * scale)
  love.graphics.setColor(255, 255, 255, 255)
end

function love.draw(dt)
  -- Draws everything onto the canvas
  game:draw()

  if quality == 0 then
    love.pushPopDrawCanvas()
  else
    post_effect:draw(function() love.pushPopDrawCanvas() end)
  end

  --love.graphics.draw(reflection, (prevWidth - realWidth*scale * 8/7) / 2, -50)

  if debug >= 1 then
    love.printDebug()
  end

  console:draw()
  --shader.unset(dt)
end
