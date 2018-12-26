local tileW, tileH, tileset, quads, tileTable
local sprite, xPos, yPos

function loadPlayer(path)
  love.filesystem.load(path)()
  sprite = '%'
  xPos = 3
  yPos = 3
end

function movePlayer(key)
  if key == 'w' then
    yPos = yPos - 1
  elseif key == 'a' then
    xPos = xPos - 1
  elseif key == 's' then
    yPos = yPos + 1
  elseif key == 'd' then
    xPos = xPos + 1
  end
end

function changePlayer(key)
  if key == '1' then
    sprite = ' '
  elseif key == '2' then
    sprite = '^'
  elseif key == '3' then
    sprite = '%'
  elseif key == '4' then
    sprite = '#'
  end
end

function newPlayer(tileWidth, tileHeight, tilesetPath, quadInfo)
  tileW = tileWidth
  tileH = tileHeight
  tileset = love.graphics.newImage(tilesetPath)

  local tilesetW, tilesetH = tileset:getWidth(), tileset:getHeight()

  quads = {}

  for _, info in ipairs(quadInfo) do
    local char = info[1]
    local x = info[2]
    local y = info[3]
    quads[char] = love.graphics.newQuad(x, y, tileW, tileH, tilesetW, tilesetH)
  end
end

function drawPlayer()
  love.graphics.draw(tileset, quads[sprite], xPos*tileW, yPos*tileH)
end
