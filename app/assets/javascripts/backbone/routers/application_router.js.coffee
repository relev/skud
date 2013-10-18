class Skud.Routers.AppRouter extends Backbone.Marionette.AppRouter

  routes: {
    'visits': 'visitList'
    'visits/create': 'createVisit'
    'visits/:id/edit': 'editVisit'

    'users': 'userList'
    'users/create': 'createUser'
    'users/:id/edit': 'editUser'

    'devices': 'deviceList'
    'devices/create': 'createDevice'
    'devices/:id/edit': 'editDevice'
  }

# list routes
  visitList: () ->
    app.dashboard.show new Skud.Views.Visits.ListView collection: app.visits
    $('#modal').foundation('reveal', 'close')

  userList: ->
    app.dashboard.show new Skud.Views.Users.ListView collection: app.users
    $('#modal').foundation('reveal', 'close')

  deviceList: ->
    app.dashboard.show new Skud.Views.Devices.ListView collection: app.devices
    $('#modal').foundation('reveal', 'close')

# create routes
  createVisit: () ->
    @visitList()
    model = new Skud.Models.Visit()
    app.visits.add model
    app.modal.show new Skud.Views.Visits.FormVisit model: model, backUrl: '#visits'
    $('#modal').foundation('reveal', 'open')

  createUser: () ->
    @userList()
    model = new Skud.Models.User()
    app.users.add model
    app.modal.show new Skud.Views.Users.FormUser model: model, backUrl: '#users'
    $('#modal').foundation('reveal', 'open')

  createDevice: () ->
    @deviceList()
    model = new Skud.Models.Device()
    app.devices.add model
    app.modal.show new Skud.Views.Devices.FormDevice model: model, backUrl: '#devices'
    $('#modal').foundation('reveal', 'open')

# edit routes
  editUser: (id) ->
    @userList()
    model = app.users.get id
    app.modal.show new Skud.Views.Users.FormUser model: model, backUrl: '#users'
    $('#modal').foundation('reveal', 'open')

  editVisit: (id) ->
    @visitList()
    model = app.visits.get id
    app.modal.show new Skud.Views.Visits.FormVisit model: model, backUrl: '#visits'
    $('#modal').foundation('reveal', 'open')

  editDevice: (id) ->
    @deviceList()
    model = app.devices.get id
    app.modal.show new Skud.Views.Devices.FormDevice model: model, backUrl: '#devices'
    $('#modal').foundation('reveal', 'open')


