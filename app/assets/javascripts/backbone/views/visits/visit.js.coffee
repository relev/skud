Skud.Views.Visits ||= {}

class Skud.Views.Visits.VisitView extends Backbone.Marionette.ItemView
  tagName: 'tr'
  template: JST["backbone/templates/visits/visit"]
  events:
    'click': 'open'
  initialize: ->
    @model.on('sync', () =>
      @render()
    )
  open: () ->
    app.modal.show new Skud.Views.Visits.CloseVisit model: @model
    $('#modal').foundation('reveal', 'open')
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


