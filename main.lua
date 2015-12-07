require("main-deps")

version = "SSP procDev-14"

-- Used for recalculating the draw functions
prevWidth = 0

-- Quality level
quality = 3

-- Level of debug information displayed
debug = 0

-- Current Game tick
t = 0

function love.load(arg)
  math.randomseed( os.time() )

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
end

-- Tick update function
function love.update(dt)
  game:update(dt)
  TEsound.cleanup()

  -- Reset post effects on window resize
  if love.window.getWidth() ~= prevWidth then
    love.setEffects()
    prevWidth = love.window.getWidth()
    scale = love.window.getHeight() / height
  end

  if t % 113 == 0 then
    math.randomseed( os.time() )
  end

  t = t+1 -- Tick done!
  gdt = dt
end

function love.setEffects()
  fg = shine.filmgrain()
  fg.opacity = 0.08
  fg.grainsize = 6
  crt = shine.crt()
  sl = shine.scanlines()
  sl.pixel_size = love.window.getHeight() / height
  bb = shine.boxblur()
  bb.radius = 1
  sc = shine.separate_chroma()
  sc.angle = 0.525
  sc.radius = 2
  gl = shine.glowsimple()
  gl.sigma = 4
  gl.min_luma = 0.95

  if quality == 1 then
    post_effect = sc--:chain(crt)
  elseif quality == 2 then
    post_effect = sc:chain(crt):chain(fg)
  elseif quality == 3 then
    post_effect = sc:chain(crt):chain(fg):chain(bb)
  end
end

function love.pushPopDrawCanvas()
  love.graphics.push()
    love.graphics.translate((prevWidth - realWidth*scale*8/7) / 2, 0)
    love.graphics.scale(scale * 8 / 7, scale)

    love.graphics.draw(canvas, 0, 0)
  love.graphics.pop()


end

function love.draw(dt)
  -- Draws everything onto the canvas
  game:draw()

  if quality == 0 then
    love.pushPopDrawCanvas()
  else
    post_effect:draw(function() love.pushPopDrawCanvas() end)
  end

  if debug >= 1 then
    love.printDebug()
  end
  --shader.unset(dt)
end
