class Actor
  constructor: ( owner, location, velocity ) ->
    @world     = owner.world
    @location  = ( location or owner.location ).clone()
    @velocity  = ( velocity or owner.velocity ).clone()

  location     : vector 0
  velocity     : vector 0
  acceleration : vector 0
  size         : vector 1,1,1

  state @::, 'abstract'
    Stationary: state 'default'
      update: ->
      enter: ( event ) ->
        o = @owner()
        o.velocity     = vector 0
        o.acceleration = vector 0

    Moving:
      update: ( dt ) ->
        o = @owner()
        o.velocity = o.velocity.add o.acceleration.scale dt
        o.location = o.location.add o.velocity.scale dt

      Falling:
        update: ( dt ) ->
          o = @owner()
          o.velocity = o.velocity.add o.world.gravity.scale dt
          @superstate().call 'update', dt

        events:
          landed: ( event ) ->
