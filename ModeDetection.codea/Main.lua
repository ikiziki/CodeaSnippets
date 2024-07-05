local c

function setup()
  -- probes the system for current style
  -- returns 1 for light 2 for dark
  local mode = objc.viewer.view.window.screen.traitCollection.userInterfaceStyle
  if mode == 1.0 then
    c = color(235)
  elseif mode == 2.0 then
    c = color(35)
  end
end

function draw()
  background(c)

end
