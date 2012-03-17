class Quat extends Vector
  constructor: ( w, x, y, z ) ->
    return new Quat w, x, y, z unless this instanceof Quat
    @w = +w or 0; @x = +x or 0; @y = +y or 0; @z = +z or 0; this

  is        : (w,x,y,z) -> @w is w and @x is x and @y is y and @z is z
  equals    :       (q) -> @w is q.w and @x is q.x and @y is q.y and @z is q.z

  clone     :           -> new Quat @w, @x, @y, @z
  conjugate :           -> new Quat @w, -@x, -@y, -@z
  inverse   :           -> if n = @magSq() then new Quat @w/n, -@x/n, -@y/n, -@z/n
  plus      :       (q) -> new Quat @w + q.w, @x + q.x, @y + q.y, @z + q.z
  minus     :       (q) -> new Quat q.w - @w, @x - q.x, @y - q.y, @z - q.z
  times     :       (q) -> new Quat @w * q.w - @x * q.x - @y * q.y - @z * q.z,
                                    @w * q.x + @x * q.w + @y * q.z - @z * q.y,
                                    @w * q.y - @x * q.z + @y * q.w + @z * q.x,
                                    @w * q.z + @x * q.y - @y * q.x + @z * q.w
  dividedBy :       (q) -> @inverse()?.times q

  zero      :           -> @w = @x = @y = @z = 0; this
  invert    :           -> if n = @magSq() then @w/=n; @x/=-n; @y/=-n; @z/=-n; this
  add       :       (q) -> @w += q.w     ; @x += q.x ; @y += q.y ; @z += q.z ; this
  subtract  :       (q) -> @w = q.w - @w ; @x -= q.x ; @y -= q.y ; @z -= q.z ; this
  mult      :       (q) -> w = @w * q.w - @x * q.x - @y * q.y - @z * q.z
                           x = @w * q.x + @x * q.w + @y * q.z - @z * q.y
                           y = @w * q.y - @x * q.z + @y * q.w + @z * q.x
                           z = @w * q.z + @x * q.y - @y * q.x + @z * q.w
                           @w = w; @x = x; @y = y; @z = z; this
  divide    :       (q) -> @invert()?.mult q

  vectorOf  :           -> new Vector @x, @y, @z