class Engine
  constructor: ->
    lastUpdateTime = timeoutId = undefined
    world = new World this
    actorList = []
    pendingActorList = []

    eventLoop = ->
      timeoutId = setTimeout eventLoop, @state().data().EVENT_LOOP_INTERVAL
      now = ( new Date ).getTime()
      if lastUpdateTime?
        deltaTime = now - lastUpdateTime
        return if deltaTime < 1
        update deltaTime
      lastUpdateTime = now

    update = ( dt ) ->
      actor.update dt for actor in actorList

    @createActor = ( actorClass, owner, location, velocity ) ->
      return unless actorClass:: instanceof Actor
      @pushActor new actorClass owner or world, location, velocity

    @pushActor = ( actor ) ->
      actorList.push actor
      actor

    state @, 'abstract'
      Idle: state 'initial'
        methods:
          pushActor: ( actor ) ->
            pendingActorList.push actor
            actor

      Engaged: state 'default'
        data:
          EVENT_LOOP_INTERVAL: 16

        events:
          enter: ( event ) ->
            actorList.concat pendingActorList
            pendingActorList.length = 0
            do eventLoop

          exit: ( event ) ->
            clearInterval intervalId
            lastUpdateTime = undefined
        
        states:
          Suspended:
            data:
              EVENT_LOOP_INTERVAL: 1000
