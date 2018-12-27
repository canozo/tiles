Map = {
  tileW = 0,
  tileH = 0,
  tileset = nil,
  quads = {},
  tileTable = {}
}

function Map:new(path)
  self = love.filesystem.load(path)()
  return self
end

function Map:load(tileWidth, tileHeight, tilesetPath, tileString, quadInfo)
  self.tileW = tileWidth
  self.tileH = tileHeight
  self.tileset = love.graphics.newImage(tilesetPath)

  local tilesetW, tilesetH = self.tileset:getWidth(), self.tileset:getHeight()

  for _, info in ipairs(quadInfo) do
    local char = info[1]
    local x = info[2]
    local y = info[3]
    self.quads[char] = love.graphics.newQuad(
      x, y, self.tileW, self.tileH, tilesetW, tilesetH
    )
  end

  local width = #(tileString:match("[^\n]+"))

  for x = 1, width, 1 do
    self.tileTable[x] = {}
  end

  local rowIndex, columnIndex = 1, 1
  for row in tileString:gmatch("[^\n]+") do
    assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    columnIndex = 1
    for character in row:gmatch(".") do
      self.tileTable[columnIndex][rowIndex] = character
      columnIndex = columnIndex + 1
    end
    rowIndex = rowIndex + 1
  end

  return self
end

function Map:draw()
  for columnIndex, column in ipairs(self.tileTable) do
    for rowIndex, char in ipairs(column) do
      local x, y = (columnIndex-1)*self.tileW, (rowIndex-1)*self.tileH
      love.graphics.draw(self.tileset, self.quads[char], x, y)
    end
  end
end
