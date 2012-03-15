class World extends Actor
  constructor: ( engine ) ->
    @owner = @world = this

  gravity: vector 0, 0, -9.8
