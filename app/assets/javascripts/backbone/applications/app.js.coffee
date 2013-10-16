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

    @appRouter = new Skud.Routers.AppRouter

    @client = new Faye.Client window.faye_server

    Backbone.Faye.bind @client, '/user', @users

    @client.subscribe '/visit_start', (massege) ->
      console.log massege
    @client.subscribe '/visit_close', (massege) ->
      console.log massege

    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
    console.log 'ClockFaceApp start!'
