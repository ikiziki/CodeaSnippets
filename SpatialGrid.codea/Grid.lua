-- Grid.lua
Grid = class()

function Grid:init(cellSize)
  self.cellSize = cellSize
  self.cells = {}
end

function Grid:_getCell(x, y)
  local col = math.floor(x / self.cellSize)
  local row = math.floor(y / self.cellSize)
  return self.cells[row] and self.cells[row][col] or {}
end

function Grid:addObject(obj)
  local x, y = obj.x, obj.y
  local col = math.floor(x / self.cellSize)
  local row = math.floor(y / self.cellSize)
  self.cells[row] = self.cells[row] or {}
  self.cells[row][col] = self.cells[row][col] or {}
  table.insert(self.cells[row][col], obj)
end

function Grid:removeObject(obj)
  local x, y = obj.x, obj.y
  local col = math.floor(x / self.cellSize)
  local row = math.floor(y / self.cellSize)
  if self.cells[row] and self.cells[row][col] then
    local cell = self.cells[row][col]
    for i, o in ipairs(cell) do
      if o == obj then
        table.remove(cell, i)
        break
      end
    end
  end
end

function Grid:getObjectsInRange(x, y, range)
  local colStart = math.floor((x - range) / self.cellSize)
  local colEnd = math.floor((x + range) / self.cellSize)
  local rowStart = math.floor((y - range) / self.cellSize)
  local rowEnd = math.floor((y + range) / self.cellSize)
  local objects = {}
  
  for r = rowStart, rowEnd do
    if self.cells[r] then
      for c = colStart, colEnd do
        if self.cells[r] and self.cells[r][c] then
          for _, obj in ipairs(self.cells[r][c]) do
            local dx = obj.x - x
            local dy = obj.y - y
            if dx * dx + dy * dy <= range * range then
              table.insert(objects, obj)
            end
          end
        end
      end
    end
  end
  
  return objects
end