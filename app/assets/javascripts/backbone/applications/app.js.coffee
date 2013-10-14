class Skud.Applications.ClockFaceApp extends Backbone.Marionette.Application

  onInitializeBefore: (options) ->
    @addRegions
      'dashboard':'#dashboard'
      'event_list':'#eventList'
      'modal':'#modal'

  onInitializeAfter: (options) ->
    @visits = new Skud.Collections.VisitsCollection
    @visits.fetch()

    @users = new Skud.Collections.UsersCollection
    @users.fetch()

    @appRouter = new Skud.Routers.AppRouter

    @client = new Faye.Client window.faye_server

    @client.subscribe '/user_change', (id) =>
      model = @users.get id
      if !model
        @users.add new Skud.Models.User id:id
        model = @users.get(id)
      model.fetch()
    @client.subscribe '/user_delete', (id) =>
      model = @users.get(id)
      if !!model
        model.destroy()

    if Backbone.history
      Backbone.history.start()

  onStart: (options) ->
    console.log 'ClockFaceApp start!'
