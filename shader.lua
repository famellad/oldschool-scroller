shader = {}

function shader.load ()
  shader.sh = love.graphics.newShader[[
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
      vec4 pixel = Texel(texture, texture_coords );
      return pixel * color;
    }
  ]]
end

function shader.set (dt)
  love.graphics.setShader(shader.sh)
end

function shader.unset (dt)
  love.graphics.setShader()
end
