App.SessionsNewRoute = Ember.Route.extend

  isAuthenticated: ->
    @.store.find('api_key', Ember.$.cookie 'caminio-session')

  beforeModel: ->
    route = @
    if !Ember.$.cookie('caminio-session')
      return
    @.isAuthenticated()
      .then ->
        route.transitionTo "dashboard.index"
      .catch ->
        console.log "not authenticated"

  setupController: (controller, model)->
    controller.reset()
