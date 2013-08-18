# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = new Skud.Applications.App()

users = new Skud.Collections.UsersCollection();
visits = new Skud.Collections.VisitsCollection();
devices = new Skud.Collections.DevicesCollection();
device_types = new Skud.Collections.DeviceTypesCollection();

app.on('start', ()->
  visits.fetch()
)
app.on('index', () ->
  console.log('index')
  app.dashboard.show(new Skud.Views.VisitsView({
    collection:visits
  }))
  app.eventList.show(new Skud.Views.EventsView)
)

app.addInitializer(
  () -> app.addRegions({
    dashboard: '#dashboard',
    eventList: '#event_list'
  })
)
app.on(
  'initialize:before',
  () ->
    app.router = new Skud.Routers.AppRouter({app:app})
)
app.on(
  'initialize:after',
  () ->
    if Backbone.history
      Backbone.history.start()
)

app.start()


