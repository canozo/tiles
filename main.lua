require 'map-functions'
require 'player-functions'

local shit = false

function love.load()
  loadMap('maps/country.lua')
  loadPlayer('player/country.lua')
end

function love.keypressed(key)
  if key == 'x' then
    print('camara si')
    shit = true
  end

  if key == 'z' then
    print('camara no')
    shit = false
  end

  if key == 'w' or key == 'a' or key == 's' or key == 'd' then
    -- es un movimiento
    movePlayer(key)
  elseif key == '1' or key == '2' or key == '3' or key == '4' then
    -- es un cambio de sprite
    changePlayer(key)
  else
    -- asaber que putas
    print(key)
  end
end

function love.draw()
  if shit then
    love.graphics.translate(-20, -20)
  else
    love.graphics.translate(20, 20)
  end
  drawMap()
  drawPlayer()
end
