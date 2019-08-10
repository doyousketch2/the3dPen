model  =  {   --   -X Left,  X Right,   -Y Up,  Y  Down,   -Z Back,  Z Forward

  {  x = 0,  y = -0.5,  z = -0.5,  initial_size = 50  },  --  back of head
  {  x = 0,  y = -0.4,  z = 0,  initial_size = 40  },  --  front of head

  {  x = -0.45,  y = 0,  z = -0.3,  initial_size = 1  },  --  L.ear
  {  x =  0.45,  y = 0,  z = -0.3,  initial_size = 1  },  --  R.ear

  {  x = -0.35,  y = 0.4,  z = -0.15,  initial_size = 8  },  --  L.jaw
  {  x =  0.35,  y = 0.4,  z = -0.15,  initial_size = 8  },  --  R.jaw

  {  x = 0,  y = 0,  z = 0.2,  initial_size = 0.5  },  --  bridge
  {  x = 0,  y = 0.18,  z = 0.22,  initial_size = 1  },  --  nose

  {  x = 0,  y = 0.6,  z = 0.15,  initial_size = 8  },  --  chin
  {  x = 0,  y = 1,  z = -0.15,  initial_size = 30  },  --  neck

}

return model
