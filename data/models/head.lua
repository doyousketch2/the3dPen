model  =  {   --   -X Left,  X Right,   -Y Up,  Y  Down,   -Z Back,  Z Forward

  {  x = 0,  y = -1,  z = -0.5,  initial_size = 18  },  --  back of head
  {  x = 0,  y = -1,  z = 0,  initial_size = 16  },  --  front of head

  {  x = -0.3,  y = 0,  z = -0.1,  initial_size = 1  },  --  L.ear
  {  x =  0.3,  y = 0,  z = -0.1,  initial_size = 1  },  --  R.ear

  {  x = -0.2,  y = 0.05,  z = 0,  initial_size = 3  },  --  L.jaw
  {  x =  0.2,  y = 0.05,  z = 0,  initial_size = 3  },  --  R.jaw

  {  x = 0,  y = 0,  z = 0.2,  initial_size = 0.5  },  --  bridge
  {  x = 0,  y = 0.1,  z = 0.22,  initial_size = 1  },  --  nose

  {  x = 0,  y = 0.3,  z = 0.15,  initial_size = 3  },  --  chin
  {  x = 0,  y = 0.8,  z = -0.03,  initial_size = 8  },  --  neck

}

return model
