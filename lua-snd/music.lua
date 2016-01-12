Class = require 'libs.hump.class'

Music = Class{}

function Music:init()
  self.tracks = {feathers = love.audio.newSource("bgm/level1-loop.ogg"),
                 shoot    = love.audio.newSource("bgm/intro-semiloop.ogg")}

  --table.insert(self.tracks,)

  self.tracks.feathers:setLooping(true)
  self.tracks.feathers:setVolume(0.7)
  self.tracks.feathers:stop()
  self.tracks.shoot:setLooping(true)
  self.tracks.shoot:setVolume(0.6)
end
