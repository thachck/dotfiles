-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- Trigger existing hyper key shortcuts

k:bind({}, 'm', nil, function() hs.eventtap.keyStroke({"cmd","alt","shift","ctrl"}, 'm') end)



-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end


-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

-- Bind Hyper + hjkl as the arrows 
arrowKey = function(arrow, modifiers) 
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, string.lower(arrow), true):post()
  event.newKeyEvent(modifiers, string.lower(arrow), false):post()
  k.triggered = true
end

k:bind({}, 'j', function() arrowKey('DOWN', {}); end, nil, function() arrowKey('DOWN', {}); end)
k:bind({}, 'k', function() arrowKey('UP', {}); end, nil, function() arrowKey('UP', {}); end)
k:bind({}, 'l', function() arrowKey('RIGHT', {}); end, nil, function() arrowKey('RIGHT', {}); end)
k:bind({}, 'h', function() arrowKey('LEFT', {}); end, nil, function() arrowKey('LEFT', {}); end)