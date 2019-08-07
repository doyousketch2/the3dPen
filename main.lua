--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Löve theTemplate       GNU GPLv3          @Doyousketch2

require 'libs.globals'
require 'libs.maths'
require 'states.state_manager'

author  = 'Doyousketch2'

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 -- initial love .load() function,  individual gamestates simply use load() to initialize.

function Lo .load()
  print('Löve app begin:  ' ..title )

  for i = 1,  #arg do -- 'arg' is a list of all the args,  so iterate through it.
    local ar  = arg[i]

    if ar == '.' then
      -- dot is used when loading in Linux,  so we'll skip it.

    elseif ar == '-h'
      or ar == '-help'
      or ar == '--help' then
        print( title ..' by ' ..author ..' for Love2D\n' )
        eve .quit()

    elseif ar == '-iddqd'
      or ar == '-godmode'
      or ar == '-gamemode'
      or ar == '-cheatmode' then
        print( 'heh, good try' )

    elseif ar == '-noclip'
      or ar == '-idspispopd' then
        print( 'you wanna walk through walls, eh?' )

    else -- do something here if certain args are passed.  just prints 'em for demonstration.
        print('arg ' ..i ..': ' ..ar )
    end -- if ar ==
  end -- for arg

  -- disable antialiasing, so pixels remain crisp while zooming,  used for pixel art
  gra .setDefaultFilter( 'nearest',  'nearest',  0 )

-- initialize random numbers, otherwise Lua defaults to same numbers each time ?!?
--  Love gen differs from Lua, it comes premixed   love2d.org/wiki/love.run
  math.randomseed( os.time() );  random();  random();  random()

  gra .setBackgroundColor( cBlue )
  gra .setColor( ltBlue )
  gra .setLineWidth( pad *2 )

  xsmallFont   = gra .newFont( fontstyle2, xsmallFontSize )
  smallFont    = gra .newFont( fontstyle2, smallFontSize )
  mediumFont   = gra .newFont( fontstyle1, mediumFontSize )
  largeFont    = gra .newFont( fontstyle2, largeFontSize )
  xlargeFont   = gra .newFont( fontstyle2, xlargeFontSize )
  gra .setFont( mediumFont )

-- clearCallbacks() not needed here, as no callbacks have been defined this early on, but you'll likely want to clear them before loading subsequent gamestates.  see 'states.state_manager' for details
  loadState( 'draw', false )
end -- Lo .load()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function Lo .quit() -- do stuff before exit,  autosave,  say goodbye...
  print( 'Löve app exit:  ' ..title ..' by ' ..author )
end -- Lo .quit()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

