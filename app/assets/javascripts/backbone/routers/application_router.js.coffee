class Skud.Routers.AppRouter extends Backbone.Marionette.AppRouter
  initialize: (options) ->
    this.app = options.app

  routes: {
    '':'index'
    'tuktuk':'tuktuk'
  }
  index: () ->
    this.app.dashboard.show(new Skud.Views.VisitsView({
      collection: this.app.collections.visits
    }))
    this.app.eventList.show(new Skud.Views.EventsView)
  tuktuk: () ->
    this.app.modal.show()
