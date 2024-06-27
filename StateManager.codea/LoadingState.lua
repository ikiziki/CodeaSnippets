-- LoadingState.lua
LoadingState = class(BaseState)

function LoadingState:init()
  -- initialization here
end

function LoadingState:enter()
  -- Load assets, initialize variables, etc.
end

function LoadingState:exit()
  -- clean up before exiting state
end

function LoadingState:update(dt)
  -- Update loading progress or any dynamic loading logic
end

function LoadingState:draw()
  -- Draw loading screen graphics
end

function LoadingState:touched(touch)
  -- handle tounch interactions
end

