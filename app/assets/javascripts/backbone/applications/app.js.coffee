class Skud.Applications.ClockFaceApp extends Backbone.Marionette.Application

  onInitializeBefore: (options) ->
    @addRegions
      'dashboard': '#dashboard'
      'event_list': '#eventList'
      'modal': '#modal'

  onInitializeAfter: (options) ->
    @visits = new Skud.Collections.VisitsCollection
    @visits.fetch()

    @users = new Skud.Collections.UsersCollection
    @users.fetch()

    @devices = new Skud.Collections.DevicesCollection
    @devices.fetch()

    @appRouter = new Skud.Routers.AppRouter

    @client = new Faye.Client window.faye_server

    Backbone.Faye.bind @client, '/user', @users

    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
    console.log 'ClockFaceApp start!'
