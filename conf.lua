io .stdout :setvbuf('no')  -- Attach a console to Windows

function love .conf(t)
  local w  = t .window
  local m  = t .modules
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  w .title  = 'Löve the3dPen'
  w .icon   = 'icon.png'

  w .width  = 640
  w .height = 480
  w .vsync  = true                     -- Enable vertical sync  (boolean)
  -- t .console  = true                -- Attach a console (boolean, Windows only)
  -- t .version  = '11.1'              -- LÖVE version this game was made for

  t .identity  = 'theTemplate'         -- Name of the save directory
  t .externalstorage  = false          -- Read & write from external storage on Android
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- enable the modules you need, for functionality.
-- disble the ones you don't, for speed.

  m .window  = true       -- Modify and retrieve information about the program's window.
  m .timer   = true       -- High-resolution timing functionality,
                          --- Disabling will result 0 delta time in love.update
  m .event   = true       -- Manage events, like keypresses.
  m .math    = true       -- System-independent mathematical functions.
  m .data    = true       -- Provides functionality for creating and transforming data.

  m .keyboard  = true     -- Interface to user's keyboard.
  m .mouse     = true     --             user's mouse.
  m .touch     = true     --            touch-screen presses.
  m .joystick  = false    --           connected joysticks.

  m .font      = true     -- Allows you to work with fonts.
  m .image     = true     -- Decode encoded image data.
  m .graphics  = true     -- Draw lines, shapes, text, Images and other Drawable objects onto screen.
                          --- Its secondary responsibilities include:
                          --- loading Images and Fonts into memory,   managing screen geometry,
                          --- creating drawable objects,  such as ParticleSystems or Canvases.

  m .sound    = true      -- Decode sound files.  It can't play sounds, see love.audio for that.
  m .audio    = true      -- Output sound to user's speakers.

  m .video    = false     -- Decode, control, and stream video files.
  m .physics  = false     -- Simulate 2D rigid body physics in a realistic manner,  based on Box2D

  m .system   = false     -- Information about user's system.
  m .thread   = false     -- Allows you to work with threads.

--  filesystem            ** Interface to user's filesystem.
end
