
function setup()
  viewer.mode = FULLSCREEN
  gameStateManager = GameStateManager()
  local initialState = LoadingState()
  if initialState and initialState.enter then
    initialState:enter()
  end
  gameStateManager:switchState(initialState)
end

function draw()
  if not gameStateManager then return end
  gameStateManager:update(DeltaTime)
  gameStateManager:draw()
end

function touched(touch)
  if not gameStateManager then return end
  gameStateManager:touched(touch)
end