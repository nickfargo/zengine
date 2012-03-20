class Triple
  x:0
  y:0
  z:0

  is      : (x,y,z) -> @x is x and @y is y and @z is z
  equals  :     (t) -> t? and @x is t.x and @y is t.y and @z is t.z

  zero    :         -> @x = @y = @z = 0; this

  dot     :     (t) -> @x * t.x + @y * t.y + @z * t.z

  magSq   :         -> @dot this
  mag     :         -> Math.sqrt @dot this