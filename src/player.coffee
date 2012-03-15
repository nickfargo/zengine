class Player extends Actor
  constructor: ->
    super

  size:       vector 0.25, 0.25, 1
  direction:  vector 0

  state @::, 'abstract'
    Moving:
      Ambulating: state 'abstract retained'
        data:
          jumpSpeed: 2.0

        update: ( dt ) ->
          o = @owner()
          o.velocity = o.velocity.add o.direction.scale dt
          @superstate().call 'update', dt
        
        direct: ( direction ) ->
          @owner().direction = direction.mult vector 1,1,0

        jump: ->
          o = @owner()
          o.velocity = vector o.velocity.x, o.velocity.y, @data().jumpSpeed
          @go 'Falling'

        Walking: state 'default'
          data:
            maxSpeed: 2.0

        Running:
          data:
            maxSpeed: 5.0

      Falling:
        events:
          landed: ( event ) ->
            @go 'Ambulating'
