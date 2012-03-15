class Vector
  constructor: ( x, y, z ) ->
    return new Vector x, y, z unless this instanceof Vector
    @x = +x or 0; @y = +y or 0; @z = +z or 0; this

  is        : (x,y,z) -> @x is x and @y is y and @z is z
  equals    :     (v) -> @x is v.x and @y is v.y and @z is v.z

  clone     :         -> new Vector @x, @y, @z
  inverse   :         -> new Vector -@x, -@y, -@z
  plus      :     (v) -> new Vector @x + v.x, @y + v.y, @z + v.z
  minus     :     (v) -> new Vector @x - v.x, @y - v.y, @z - v.z
  times     :     (v) -> new Vector @x * v.x, @y * v.y, @z * v.z
  scale     :     (a) -> new Vector a * @x, a * @y, a * @z

  zero      :         -> @x = @y = @z = 0; this
  invert    :         -> @x = -@x  ; @y = -@y  ; @z = -@z  ; this
  add       :     (v) -> @x += v.x ; @y += v.y ; @z += v.z ; this
  subtract  :     (v) -> @x -= v.x ; @y -= v.y ; @z -= v.z ; this
  mult      :     (v) -> @x *= v.x ; @y *= v.y ; @z *= v.z ; this
  grow      :     (a) -> @x *= a   ; @y *= a   ; @z *= a   ; this

  dot       :     (v) -> @x * v.x + @y * v.y + @z * v.z
  cross     :     (v) -> new Vector @y * v.z - @z * v.y,
                                    @z * v.x - @x * v.z,
                                    @x * v.y - @y * v.x

  mag       :         -> Math.sqrt @dot this
  magSq     :         -> @dot this
  normal    :         -> if @is 0,0,0 then new Vector 0 else @scale 1 / @mag()
  normalize :         -> if @is 0,0,0 then this else @scaleBy 1 / @mag()

vector = ( x, y, z ) -> new Vector x, y, z
