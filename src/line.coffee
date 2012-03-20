class Line
  constructor: ( @origin, @dir ) ->

  commonNormal: ( l ) ->
    a = @dir.cross l.dir
    return if a.is 0,0,0
    b = l.origin.minus @origin
    a = a.mult b.dot a
    c = b.subtract a
    d = @dir.normal()
    e = d.mult c.dot d
    f = e.subtract c
    g = d.mult Math.tan Math.acos l.dir.dot(f) / Math.sqrt l.dir.magSq() * f.magSq()
    h = @origin.plus e.add g
    return new Line h, h.add a
