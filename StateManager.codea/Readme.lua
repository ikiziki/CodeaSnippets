--[[
Explanation

	•	Main.lua:
	•	The setup() function initializes the game setup once at the start, creating an instance of GameStateManager and switching to an initial state (LoadingState).
  	•	The draw() function is the main loop where game logic updates (update(dt)) and drawing (draw()) are handled through GameStateManager.
    	•	GameStateManager.lua:
    	•	Manages switching between different game states (LoadingState, etc.) using switchState(newState).
    	•	Implements update(dt) and draw() methods to forward these calls to the current state.
    	•	BaseState.lua:
    	•	Defines a base class BaseState with basic methods (enter(), exit(), update(dt), draw()) for handling game state transitions and logic.
    	•	LoadingState.lua:
    	•	An example state (LoadingState) inheriting from BaseState, showcasing how different states can implement specific behaviors (enter(), update(dt), draw()).
    
    Usage
    	•	Updating Game Logic: Inside draw(), update(dt) of the current state (LoadingState, etc.) is called automatically. This approach ensures all game logic and rendering are synchronized within Codea’s main execution loop.
]]--