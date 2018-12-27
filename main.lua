require 'map'
require 'player'

function love.load()
  map = Map:new('maps/country.lua')
  player = Player:new('player/country.lua')
end

function love.keypressed(key)
  if key == 'w' or key == 'a' or key == 's' or key == 'd' then
    -- es un movimiento
    player:move(key)
  elseif key == '1' or key == '2' or key == '3' or key == '4' then
    -- es un cambio de sprite
    player:change(key)
  else
    -- asaber que putas
    print(key)
  end
end

function love.draw()
  map:draw()
  player:draw()
end
