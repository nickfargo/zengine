class Plane extends Quadruple
  constructor: ( w, x, y, z ) ->
    return new Plane w, x, y, z unless this instanceof Plane
    @w = +w or 0; @x = +x or 0; @y = +y or 0; @z = +z or 0; this

  @fromPoints = ( a, b, c ) ->
    return if arguments.length < 3 or a.is b or b.is c or c.is a

    x = a.y * ( b.z - c.z ) + b.y * ( c.z - a.z ) + c.y * ( a.z - b.z )
    y = a.z * ( b.x - c.x ) + b.z * ( c.x - a.x ) + c.z * ( a.x - b.x )
    z = a.x * ( b.y - c.y ) + b.x * ( c.y - a.y ) + c.x * ( a.y - b.y )

    return if x is 0 and y is 0 and z is 0
        
    w = -a.x * ( b.y * c.z - c.y * b.z ) -
         b.x * ( c.y * a.z - a.y * c.z ) -
         c.x * ( a.y * b.z - b.y * a.z )

    return new Plane w, x, y, z

  is        : (w,x,y,z) -> @w is w and @x is x and @y is y and @z is z
  equals    :       (p) -> @w is p.w and @x is p.x and @y is p.y and @z is p.z

  clone     :           -> new Plane @w, @x, @y, @z

  compare   :       (v) -> @w + @dot v
  contains  :       (v) -> 0 is @compare v === 0