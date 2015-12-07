Class = require 'libs.hump.class'

Music = Class{}

function Music:init()
  self.tracks = {feathers = love.audio.newSource("bgm/level1-loop.ogg")}

  --table.insert(self.tracks,)

  self.tracks.feathers:setLooping(true)
  self.tracks.feathers:setVolume(0.0)
end
