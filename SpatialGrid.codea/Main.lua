-- Main.lua
-- Include the Grid class
-- local Grid = require "Grid"

-- Declare global variables
local grid
local objects = {}
local touchX, touchY = WIDTH / 2, HEIGHT / 2  -- Default touch position

function setup()
  -- Initialize the grid with a cell size of 100 units
  grid = Grid(100)
  
  -- Create and add some objects to the grid
  for i = 1, 1000 do
    local obj = Object(math.random(WIDTH), math.random(HEIGHT))
    table.insert(objects, obj)
    grid:addObject(obj)
  end
end

-- Define a simple object class
Object = class()

function Object:init(x, y)
  self.x = x
  self.y = y
end

function Object:draw()
  ellipse(self.x, self.y, 10)
end

function draw()
  background(255)
  
  -- Draw all objects
  for _, obj in ipairs(objects) do
    obj:draw()
  end
  
  -- Example: Query objects within a certain range
  local range = 50
  local nearbyObjects = grid:getObjectsInRange(touchX, touchY, range)
  
  stroke(255, 0, 0)
  strokeWidth(2)
  for _, obj in ipairs(nearbyObjects) do
    line(touchX, touchY, obj.x, obj.y)
  end
end

function touched(touch)
  if touch.state == BEGAN or touch.state == MOVING then
    touchX = touch.x
    touchY = touch.y
  end
end