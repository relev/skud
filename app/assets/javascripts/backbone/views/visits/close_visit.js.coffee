Skud.Views.Visits ||= {}

class Skud.Views.Visits.CloseVisit extends Backbone.Marionette.ItemView
  template: JST["backbone/templates/visits/close_visit"]
  events:
    'click #closed': 'close'
    'click #close': 'back'

  initialize: (options) ->
    @backUrl = options.backUrl

  onShow: ->
    rivets.bind @$el, model:@model

  close: ->
    console.log('visit:closed')
    @model.save {}

  back: ->
    $('#modal').foundation('reveal', 'close')

  templateHelpers:
    userName: () ->
      user = app.users.get @user_id
      if !!user
        name = user.get 'first_name'
      else
        name = 'unknown user'
      name
    deviceName: () ->
      device = app.devices.get @device_id
      if !!device
        name = device.get 'name'
      else
        name = 'unknown device'
      name


