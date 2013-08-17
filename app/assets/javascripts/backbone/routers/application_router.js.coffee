class Skud.Routers.AppRouter extends Backbone.Marionette.AppRouter
  initialize: (options) ->
    this.app = options.app

  routes: {
    '':'index'
  }
  index: () -> this.app.trigger('index')
  
