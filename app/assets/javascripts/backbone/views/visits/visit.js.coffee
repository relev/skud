Skud.Views.Visits ||= {}

class Skud.Views.Visits.VisitView extends Backbone.Marionette.ItemView
  tagName: 'tr'
  template: JST["backbone/templates/visits/visit"]
  initialize: ->
    @model.on('sync', () =>
      @render()
    )
  templateHelpers:
    userName: () ->
      user = app.users.get @user_id
      name = user.get 'first_name'
      name
    deviceName: () ->
      device = app.devices.get @device_id
      name = device.get 'name'
      name


