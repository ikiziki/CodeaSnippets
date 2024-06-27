-- BaseState.lua

BaseState = class()

function BaseState:init()
  -- This method is called when a new instance of the state is created.
end

function BaseState:enter()
  -- This method is called when the state is entered.
end

function BaseState:exit()
  -- This method is called when the state is exited.
end

function BaseState:update(dt)
  -- This method is called every frame with the time since the last frame.
end

function BaseState:draw()
  -- This method is called every frame to draw the state.
end

function BaseState:touched(touch)
  -- This method is called whenever a touch is detected.
end