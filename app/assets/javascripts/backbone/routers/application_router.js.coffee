class Skud.Routers.AppRouter extends Backbone.Marionette.AppRouter
  initialize: (options) ->
    this.app = options.app

  routes: {
    '':'index'
  }
  index: () ->
    this.app.dashboard.show(new Skud.Views.VisitsView({
      collection: this.app.collections.visits
    }))
    this.app.eventList.show(new Skud.Views.EventsView)
  
