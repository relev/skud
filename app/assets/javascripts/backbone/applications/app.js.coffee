class Skud.Applications.ClockFaceApp extends Backbone.Marionette.Application

  onInitializeBefore: (options) ->
    @addRegions
      'dashboard':'#dashboard'
      'event_list':'#eventList'
      'modal':'#modal'

  onInitializeAfter: (options) ->
    @visits = new Skud.Collections.VisitsCollection
    @visits.fetch()

    @appRouter = new Skud.Routers.AppRouter

    @client = new Faye.Client window.faye_server

    @client.subscribe 'visit_new', (user_id) =>
      if !user_id
        user = @users.get user_id
      visit = new Skud.Models.Visit()

    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
    console.log 'ClockFaceApp start!'
