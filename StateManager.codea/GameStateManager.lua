GameStateManager = class()

function GameStateManager:init()
  self.currentState = nil
  self.stateStack = {}
end

function GameStateManager:switchState(newState)
  if newState == nil then
    error("newState cannot be nil")
  end
  if self.currentState and self.currentState.exit then
    self.currentState:exit()
  end
  self.currentState = newState
  if self.currentState and self.currentState.enter then
    self.currentState:enter()
  end
end

function GameStateManager:pushState(newState)
  if newState == nil then
    error("newState cannot be nil")
  end
  if self.currentState and self.currentState.pause then
    self.currentState:pause()
  end
  table.insert(self.stateStack, self.currentState)
  self.currentState = newState
  if self.currentState and self.currentState.enter then
    self.currentState:enter()
  end
end

function GameStateManager:popState()
  if self.currentState and self.currentState.exit then
    self.currentState:exit()
  end
  self.currentState = table.remove(self.stateStack)
  if self.currentState and self.currentState.resume then
    self.currentState:resume()
  end
end

function GameStateManager:update(DeltaTime)
  if self.currentState and self.currentState.update then
    self.currentState:update(DeltaTime)
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




