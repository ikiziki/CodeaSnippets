-- GameStateManager.lua

GameStateManager = class()

function GameStateManager:init()
  self.currentState = nil
end

function GameStateManager:switchState(newState)
  if self.currentState and self.currentState.exit then
    self.currentState:exit()
  end
  self.currentState = newState
  if self.currentState and self.currentState.enter then
    self.currentState:enter()
  end
end

function GameStateManager:update(dt)
  if self.currentState and self.currentState.update then
    self.currentState:update(dt)
  end
end

function GameStateManager:draw()
  if self.currentState and self.currentState.draw then
    self.currentState:draw()
  end
end

function GameStateManager:touched(touch)
  if self.currentState and self.currentState.touched then
    self.currentState:touched(touch)
  end
end