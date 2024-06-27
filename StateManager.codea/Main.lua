-- Main.lua

function setup()
  -- Initialize game setup here (executes once)
  gameStateManager = GameStateManager()
  gameStateManager:switchState(LoadingState())
end

function draw()
  -- Update and draw graphics here (runs 60 times per second)
  gameStateManager:update(DeltaTime)
  gameStateManager:draw()
end

function touched(touch)
  gameStateManager:touched(touch)
end