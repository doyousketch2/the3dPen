--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Clear callbacks -  https://love2d.org/wiki/love#Callbacks

-- This is so that when you switch gamestate,
-- it won't try to use code from a previously loaded state.

-- example:
--   main menu has a help button at the bottom, but game doesn't.
--   you don't want the user to click down there while playing,
--   and accidentially bring up a help screen.

-- so we clear out code that's not being used.
-- Do this w/ any callbacks that you don't intended to use,
-- in the next gamestate that's about to be loaded.

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function clearKeys()
  Lo .keypressed  = nil
  Lo .keyreleased  = nil
end -- clearKeys

--~~~~~~~~~~~~~~~~~~~~~~~~~~~

function clearTouchpad()
  Lo .touchmoved  = nil
  Lo .touchpressed  = nil
  Lo .touchreleased  = nil
end -- clearTouchpad()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~

function clearMouse()
  Lo .wheelmoved  = nil
  Lo .mousemoved  = nil
  Lo .mousepressed  = nil
  Lo .mousereleased  = nil
end -- clearMouse()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~

function clearGamepad()
  Lo .gamepadaxis  = nil
  Lo .gamepadpressed  = nil
  Lo .gamepadreleased  = nil
end --  clearGamepad()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~

function clearJoystick()
  Lo .joystickhat  = nil
  Lo .joystickaxis  = nil
  Lo .joystickpressed  = nil
  Lo .joystickreleased  = nil
end -- clearJoystick()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- you can clear individual devices, w/ funct's above
-- or use this helper function to clear them all

function clearCallbacks()
  clearKeys()
  clearTouchpad()
  clearMouse()
  clearGamepad()
  clearJoystick()
end -- clearCallbacks()

-- you'll likely never redefine these when changing state:
--  .errhand  .errorhandler  .focus  .quit  .resize  .run  .visible

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- define state manager,
-- which will load desired state module from states folder

function loadState( state, clear )
  if clear then  clearCallbacks()  end

  require ( 'states.' ..state )
  print( 'Gamestate:  ' ..state )

-- similar to main.lua which uses love.load()  however,
-- individual gamestates simply use load() to initialize
  load()

end -- loadState()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- you normally want to set "clear" to true.
--    loadState( 'statename', true )

-- if set to false, this will bypass clearing callbacks,
-- so you can decide which individual devices you prefer to clear

-- example:
--   you want to clear the keyboard callbacks,
--   but keep everything else the way it is:

--    clearKeys()
--    loadState( 'statename', false )

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

