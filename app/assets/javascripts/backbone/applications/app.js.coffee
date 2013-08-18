class Skud.Applications.App extends Backbone.Marionette.Application
  regions: {
    dashboard: '#dashboard',
    eventList: '#event_list'
  }

  onInitializeBefore: (options) ->
    this.collections = {
      users: new Skud.Collections.UsersCollection(),
      visits: new Skud.Collections.VisitsCollection(),
      devices: new Skud.Collections.DevicesCollection()
    }

    this.addRegions({
      dashboard: '#dashboard',
      eventList: '#event_list'
    })
    this.router = new Skud.Routers.AppRouter({app:this})

  onInitializeAfter: (options) ->
    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
    _.each(this.collections, (item) -> item.fetch())