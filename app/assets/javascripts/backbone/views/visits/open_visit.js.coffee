Skud.Views.Visits ||= {}

class Skud.Views.Visits.OpenVisit extends Backbone.Marionette.ItemView
  template: JST["backbone/templates/visits/open_visit"]
  events:
    'click #start': 'start'
    'click #cancel': 'cancel'

  initialize: (options) ->
    @backUrl = options.backUrl

  start: ->
    @model.save {}, {
      success: (model) ->
        console.log 'started: '
        console.log model.toJSON()
      error: (model) ->
        console.log 'not started: '
        console.log model.toJSON()
    }
    @back()

  cancel: ->
    @model.destroy()
    @back()

  back: ->
    $('#modal').foundation('reveal', 'close')

  templateHelpers:
    userName: () ->
      user = app.users.get @user_id
      name = user.get 'first_name'
      name
    deviceName: () ->
      device = app.devices.get @device_id
      name = device.get 'name'
      name


