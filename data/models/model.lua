model  =  {   --   -X Left,  X Right,   -Y Up,  Y  Down,   -Z Back,  Z Forward

  {  x = 0,  y = -1,  z = -0.02,  initial_size = 15  },  --  back of head
  {  x = 0,  y = -1,  z = 0.05,  initial_size = 12  },  --  head
  {  x = 0,  y = -0.92,  z = 0.1,  initial_size = 11  },  --  face
  {  x = 0,  y = -0.95,  z = 0.22,  initial_size = 1  },  --  nose
  {  x = 0,  y = -0.8,  z = -0.03,  initial_size = 8  },  --  neck

--  arms

  {  x = -0.25,  y = -0.65,  z = 0,  initial_size = 6  },  --  L.shoulder
  {  x = 0.25,  y = -0.65,  z = 0,  initial_size = 6  },  --  R.shoulder

  {  x = -0.35,  y = -0.3,  z = -0.1,  initial_size = 5  },  --  L.elbow
  {  x = 0.35,  y = -0.3,  z = -0.1,  initial_size = 5  },  --  R.elbow

  {  x = -0.4,  y = 0.05,  z = 0.08,  initial_size = 2  },  --  L.wrist
  {  x = 0.4,  y = 0.05,  z = 0.08,  initial_size = 2  },  --  R.wrist

  {  x = -0.4,  y = 0.12,  z = 0.1,  initial_size = 3  },  --  L.hand
  {  x = 0.4,  y = 0.12,  z = 0.1,  initial_size = 3  },  --  R.hand

  {  x = -0.39,  y = 0.2,  z = 0.09,  initial_size = 2  },  --  L.fingers
  {  x = 0.39,  y = 0.2,  z = 0.09,  initial_size = 2  },  --  R.fingers

--  torso

  {  x = -0.1,  y = -0.6,  z = 0,  initial_size = 12  },  --  chest
  {  x = 0.1,  y = -0.6,  z = 0,  initial_size = 12  },  --  chest

  {  x = -0.1,  y = -0.4,  z = 0.02,  initial_size = 10  },  --  spine
  {  x = 0.1,  y = -0.4,  z = 0.02,  initial_size = 10  },  --  spine

  {  x = -0.1,  y = -0.2,  z = 0,  initial_size = 17  },  --  belly
  {  x = 0.1,  y = -0.2,  z = 0,  initial_size = 17  },  --  belly

  {  x = -0.18,  y = 0,  z = -0.03,  initial_size = 16  },  --  hips
  {  x = 0.18,  y = 0,  z = -0.03,  initial_size = 16  },  --  hips

--  legs

  {  x = -0.2,  y = 0.3,  z = 0,  initial_size = 10  },  --  L.thigh
  {  x = 0.2,  y = 0.3,  z = 0,  initial_size = 10  },  --  R.thigh

  {  x = -0.25,  y = 0.6,  z = 0.1,  initial_size = 7  },  --  L.knee
  {  x = 0.25,  y = 0.6,  z = 0.1,  initial_size = 7  },  --  R.knee

  {  x = -0.28,  y = 0.8,  z = 0,  initial_size = 6  },  --  L.shin
  {  x = 0.28,  y = 0.8,  z = 0,  initial_size = 6  },  --  R.shin

  {  x = -0.3,  y = 1.2,  z = -0.12,  initial_size = 5  },  --  L.heel
  {  x = 0.3,  y = 1.2,  z = -0.12,  initial_size = 5  },  --  R.heel

  {  x = -0.28,  y = 1.22,  z = 0.05,  initial_size = 3  },  --  L.big.toe
  {  x = 0.28,  y = 1.22,  z = 0.05,  initial_size = 3  },  --  R.big.toe

  {  x = -0.28,  y = 1.24,  z = 0.2,  initial_size = 1  },  --  L.big.toe
  {  x = 0.28,  y = 1.24,  z = 0.2,  initial_size = 1  },  --  R.big.toe

}

return model
