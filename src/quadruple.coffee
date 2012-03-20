class Quadruple extends Triple
  w:0

  is      : (w,x,y,z) -> @w is w and @x is x and @y is y and @z is z
  equals  :       (q) -> q? and @w is q.w and @x is q.x and @y is q.y and @z is q.z
  
  zero    :           -> @w = @x = @y = @z = 0; this

  dot     :       (q) -> @w * q.w + @x * q.x + @y * q.y + @z * q.z