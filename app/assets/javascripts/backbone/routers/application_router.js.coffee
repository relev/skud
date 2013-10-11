class Skud.Routers.AppRouter extends Backbone.Marionette.AppRouter
  initialize: (options) ->
    this.app = options.app

  routes: {
    'visit':'visitList'
    'user':'userList'
    'visit/create':'createVisit'
    'user/:id/visit/create':'createUserVisit'
    'user/create':'createUser'
  }

# list routes
  visitList: ->
    app.dashboard.show new Skud.Views.Visits.ListView collection: app.visits
    $('#modal').foundation('reveal', 'close')

  userList: ->
    app.dashboard.show new Skud.Views.Users.ListView collection: app.users
    $('#modal').foundation('reveal', 'close')

# create routes
  createVisit: ->
    @visitList()
    model = new Skud.Models.Visit()
    app.visits.add model
    app.modal.show new Skud.Views.Visits.FormVisit model:model
    $('#modal').foundation('reveal', 'open')

  createUserVisit: (id) ->
    @visitList()
    model = new Skud.Models.Visit user_id:id
    app.visits.add model
    app.modal.show new Skud.Views.Visits.FormVisit model:model
    $('#modal').foundation('reveal', 'open')


  createUser: ->
    @userList()
    model = new Skud.Models.User()
    app.users.add model
    app.modal.show new Skud.Views.Users.FormUser model:model
    $('#modal').foundation('reveal', 'open')


