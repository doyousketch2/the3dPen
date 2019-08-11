--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local model  = ''
local models  = {  'data/models/model'  }

local currentModel  = 1
local pastPointSize  = 0
local previousNode  = 0
local time_delta  = 0
local mouseClickTimer  = 0

local function calculate_color( verts )
  table .sort(  verts,  function( a, b ) return a.z < b.z end  )  --  Z-sort

  if major > 10 then  --  versions after 10 have color range 0-1
    for i = 1,  #verts do

      if verts[i] .selected then  --  highlight selected vert
        verts[i] .color  = {  1,  0.8,  0.8  }
      else
        local c  = i /#verts
        verts[i] .color  = {  c,  c *0.9,  c *0.9  }
      end  --  verts[i] .selected

    end  --  #verts

  else  --  version before 11, so color is range 0-255

    for i = 1,  #verts do
      local c  = i /#verts
      verts[i] .color  = {  c *255,  c *200,  c *200  }
    end  --  #verts
  end  --  major version before or after 10

  return verts
end  --  calculate_color()


local function resetModel()
  verts  = {}
  pitch,  yaw,  roll,  zoom  = 0,  0,  0,  math.min( w2, h2 )
  horiz_offset,  vert_offset  = 0,  0

  for i = 1,  #model do
    verts[i]  = {}
    verts[i] .x  = model[i] .x *zoom
    verts[i] .y  = model[i] .y *zoom
    verts[i] .z  = model[i] .z *zoom

    verts[i] .selected  = false
    verts[i] .initial_size  = model[i] .initial_size

    verts[i] .radius  = (verts[i] .z +zoom *50) /1000 +verts[i] .initial_size
  end  --  #model
  verts  = calculate_color( verts )

  zoom  = 100  --  make it say 100 % after model is loaded, regardless of initial normalized value
end  --  resetView()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function load()
  dir  = 'data/models'
  local dirItems  = fil .getDirectoryItems( dir )

  for _, item in ipairs( dirItems ) do
    print(item)
    if item :sub( -4 ) == '.lua' then  --  if a .lua file
      filename  = item :sub( 1, -5 )  --  strip extension
      print(filename)
      if filename ~= 'model' then
        models[ #models +1 ]  = dir ..'.' ..filename
      end  --  add .lua modules beyond the original model

    end  --  .lua
  end  --  ipairs

  for i, v in ipairs( models ) do
    print(i, v)
  end

  --  gra .setBackgroundColor( { 0.5, 0.5, 0.5 }  )
  gra .setFont( smallFont )
  pitch,  yaw,  roll  = 0,  0,  0
  xx,  yy,  zz,  xx2,  yy2  = 0, 0, 0, 0, 0

  horiz_offset,  max_horiz_offset  = 0,  w5
  vert_offset,  max_vert_offset  = 0,  h5

  sign  = 0  --   +1  or  -1
  zoom  = math.min( w2, h2 )  --  normalize within display limits, use smaller of the two
  minzoom,  maxzoom  = 25,  200

  verts  = {}
  segments  = 12  --  resolution of circles
  model  = require ( models[ currentModel ] )

  for i = 1,  #model do
    verts[i]  = {}

    verts[i] .x  = model[i] .x *zoom
    verts[i] .y  = model[i] .y *zoom
    verts[i] .z  = model[i] .z *zoom

    verts[i] .selected  = false
    verts[i] .initial_size  = model[i] .initial_size

    verts[i] .radius  = (verts[i] .z +zoom *50) /1000 +verts[i] .initial_size

  end  --  #verts
  verts  = calculate_color( verts )

  zoom  = 100  --  make it say 100 % after model is loaded, regardless of initial normalized value
end  --  load()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Scancodes are international,  keyboard layout-independent.
-- see scancodes.txt in the data dir for reference.

function Lo .keypressed( key, scancode, isrepeat ) -- action continues while key pressed
  if scancode == 'escape' or ( major < 10 and key == 'escape' ) then
    eve .quit()

  elseif scancode == 'return' or ( major < 10 and key == 'return' ) then  --  next model
    currentModel  = currentModel +1
    if currentModel > #models then currentModel  = 1 end
    model  = require ( models[ currentModel ] )
    resetModel()
    print( currentModel, models[ currentModel ] )
  end  --  if scancode...
end -- Lo .keypressed()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Callback function used to update state of game every frame,  occurs before draw()

function Lo .update( dt ) -- DeltaTime  = time since last update,  in seconds.
  --timer  = timer +dt
  time_delta  = dt

  --  mouse stuff  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  mouseClickimer  = mouseClickTimer +dt

  if mou .isDown(1) or ( major < 10 and mou .isDown('l') ) then
    local mouseX = mou .getX()
    local mouseY = mou .getY()
    local closestNode = 0
    local distance  = 999999

    if previousNode > 0 and previousNode <= #verts then verts[ previousNode ] .selected  = false end

    print( 'clicked' )

    for i = 1,  #verts do
      local axx  = abs( verts[i] .x -mouseX )
      local byy  = abs( verts[i] .y -mouseY )

      --  only sqare if xx and yy distances are less than smallest distance yet
      if axx <= distance and byy <= distance then
        local pythag  = axx ^2 +byy ^2  --  a squared +b squared

        if pythag < distance then
          distance  = pythag
          closestNode  = i
        end  --  pythag
      end  --  axx  byy
    end  --  #verts

  print( closestNode )
  verts[ closestNode ] .selected  = true
  previousNode  = closestNode

  elseif mouseClickTimer > 2.5 then
    verts[ previousNode ] .selected  = false
  end  --  mou .isDown(1)

  --  keyboard stuff  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  if key .isDown( 'space', ' ' ) then  --  reset view
    resetModel()
  end  --  space

  --  rotation

  if key .isDown( 'up', 'down' ) then
    if key .isDown( 'up' ) then sign  =  0.01
    else                        sign  = -0.01
    end

    if key .isDown( 'lshift', 'rshift' ) then sign  = sign *3 end
    cosθ,  sinθ  = cos( sign ),  sin( sign )

    for i = 1,  #verts do
      yy  = verts[i] .y *cosθ  -verts[i] .z *sinθ
      zz  = verts[i] .z *cosθ  +verts[i] .y *sinθ

      verts[i] .y,  verts[i] .z  = yy,  zz
      verts[i] .radius  = (verts[i] .z +zoom *50) /1000 +verts[i] .initial_size
    end  --  #verts

    pitch  = pitch +sign
    verts  = calculate_color( verts )
  end  --   up  down


  if key .isDown( 'left', 'right' ) then
    if key .isDown( 'left' ) then sign  = 0.01
    else                          sign  = -0.01
    end

    if key .isDown( 'lshift', 'rshift' ) then sign  = sign *3 end
    cosθ,  sinθ  = cos( sign ),  sin( sign )

    for i = 1,  #verts do
      xx  = verts[i] .x *cosθ  -verts[i] .z *sinθ
      zz  = verts[i] .z *cosθ  +verts[i] .x *sinθ

      verts[i] .x,  verts[i] .z  = xx,  zz
      verts[i] .radius  = (verts[i] .z +zoom *50) /1000 +verts[i] .initial_size
    end  --  #verts

    yaw  = yaw +sign
    verts  = calculate_color( verts )
  end  --   left  right


  if key .isDown( ',', '.', 'q', 'e' ) then
    if key .isDown( ',', 'q' ) then sign  = -0.01
    else                            sign  =  0.01
    end

    if key .isDown( 'lshift', 'rshift' ) then sign  = sign *3 end
    cosθ,  sinθ  = cos( sign ),  sin( sign )

    for i = 1,  #verts do
      xx  = verts[i] .x *cosθ  -verts[i] .y *sinθ
      yy  = verts[i] .y *cosθ  +verts[i] .x *sinθ

      verts[i] .x,  verts[i] .y  = xx,  yy
    end  --  #verts

    roll  = roll +sign
  end  --   ,  .

  --  pan

  if key .isDown( 'w' ) and vert_offset > -max_vert_offset then
    sign  = -1

    if key .isDown( 'lshift', 'rshift' ) then sign  = sign *5 end
    vert_offset  = vert_offset +sign

    if vert_offset < -max_vert_offset then vert_offset  = -max_vert_offset end
  end  --  w


  if key .isDown( 's' ) and vert_offset < max_vert_offset then
    sign  = 1

    if key .isDown( 'lshift', 'rshift' ) then sign  = sign *5 end
    vert_offset  = vert_offset +sign

    if vert_offset > max_vert_offset then vert_offset  = max_vert_offset end
  end  --  s


  if key .isDown( 'a' ) and horiz_offset > -max_horiz_offset then
    sign  = -1

    if key .isDown( 'lshift', 'rshift' ) then sign  = sign *5 end
    horiz_offset  = horiz_offset +sign

    if horiz_offset < -max_horiz_offset then horiz_offset  = -max_horiz_offset end
  end  --   a

  if key .isDown( 'd' ) and horiz_offset < max_horiz_offset then
    sign  = 1

    if key .isDown( 'lshift', 'rshift' ) then sign  = sign *5 end
    horiz_offset  = horiz_offset +sign

    if horiz_offset > max_horiz_offset then horiz_offset  = max_horiz_offset end
  end  --  d

  --  zoom

  if key .isDown( 'pageup' ) and zoom < maxzoom then
    zoom  = zoom +1

    for i = 1,  #verts do
      verts[i] .x  = verts[i] .x *1.01
      verts[i] .y  = verts[i] .y *1.01
      verts[i] .z  = verts[i] .z *1.01
      verts[i] .radius  = (verts[i] .z +zoom *50) /1000 +verts[i] .initial_size
    end --  #verts
    verts  = calculate_color( verts )
  end  --  pageup

  if key .isDown( 'pagedown' ) and zoom > minzoom then
    zoom  = zoom -1

    for i = 1,  #verts do
      verts[i] .x  = verts[i] .x *0.99
      verts[i] .y  = verts[i] .y *0.99
      verts[i] .z  = verts[i] .z *0.99
      verts[i] .radius  = (verts[i] .z +zoom *50) /1000 +verts[i] .initial_size
    end --  #verts
    verts  = calculate_color( verts )
  end  --  pagedown

end -- Lo .update(dt)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Callback function used to draw on the screen every frame.

function Lo .draw()
  --gra .setFont( smallFont )

  for i = 1,  #verts do
      gra .setColor(  verts[i] .color  )
      xx  = verts[i] .x +w5 +horiz_offset
      yy  = verts[i] .y +h5 +vert_offset
      local text_offset  = verts[i] .radius *2

      gra .setLineWidth( verts[i] .radius /2 )

      if i == #verts then  --  linked list to get next vertex
        xx2  = verts[1] .x +w5 +horiz_offset
        yy2  = verts[1] .y +h5 +vert_offset
        --  gra .line(  xx,  yy,  xx2,  yy2 )
      end  --  if i

      --  .circle( mode, x, y, radius, segments )
      gra .circle(  'fill',  xx,  yy,  verts[i] .radius,  verts[i] .radius +3  )

      --[[
      if pastPointSize ~= verts[i] .radius then
        gra .setPointSize( verts[i] .radius )
        pastPointSize  = verts[i] .radius
      end

      if major < 10 then
        gra .point( xx, yy )
      else
        gra .points( xx, yy )
      end
      ]]--

      --  gra .print( i,  xx +text_offset,  yy +text_offset )  --  print Z-order numbers
  end --  #verts

  gra .setColor( ltBlue )
  --gra .setFont( mediumFont )
  gra .print( ('redraw: %.8f') :format( time_delta ),    w8,  5  )

  gra .print( ('pitch: %.3f') :format( pitch ),        5,  5  )
  gra .print(  ( 'yaw: %.3f') :format( yaw ),          5,  20 )
  gra .print(  ('roll: %.3f') :format( roll ),         5,  35 )

  gra .print(  ('zoom: %s%%') :format( zoom ),         5,  55 )
  gra .print(  ('horiz: %s') :format( horiz_offset ),  5,  70 )
  gra .print(  ('vert: %s') :format( vert_offset ),    5,  85 )
end -- Lo .draw()

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

