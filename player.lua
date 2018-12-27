Player = {
  tileW = 0,
  tileH = 0,
  tileset = nil,
  quads = {},
  tileTable = {},
  sprite = ' ',
  xPos = 0,
  yPos = 0
}

function Player:new(path)
  self = love.filesystem.load(path)()
  self.sprite = '%'
  self.xPos = 3
  self.yPos = 3
  return self
end

function Player:load(tileWidth, tileHeight, tilesetPath, quadInfo)
  self.tileW = tileWidth
  self.tileH = tileHeight
  self.tileset = love.graphics.newImage(tilesetPath)

  local tilesetW, tilesetH = self.tileset:getWidth(), self.tileset:getHeight()

  for _, info in ipairs(quadInfo) do
    local char = info[1]
    local x = info[2]
    local y = info[3]
    self.quads[char] = love.graphics.newQuad(
      x, y, self.tileW, self.tileH, tilesetW, tilesetH)
  end

  return self
end

function Player:move(key)
  if key == 'w' then
    self.yPos = self.yPos - 1
  elseif key == 'a' then
    self.xPos = self.xPos - 1
  elseif key == 's' then
    self.yPos = self.yPos + 1
  elseif key == 'd' then
    self.xPos = self.xPos + 1
  end
end

function Player:change(key)
  if key == '1' then
    self.sprite = ' '
  elseif key == '2' then
    self.sprite = '^'
  elseif key == '3' then
    self.sprite = '%'
  elseif key == '4' then
    self.sprite = '#'
  end
end

function Player:draw()
  local x, y = self.xPos*self.tileW, self.yPos*self.tileH
  love.graphics.draw(self.tileset, self.quads[self.sprite], x, y)
end
