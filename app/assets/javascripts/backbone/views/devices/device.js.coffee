Skud.Views.Devices ||= {}

class Skud.Views.Devices.DeviceView extends Backbone.Marionette.ItemView
  tagName: 'tr'
  template: JST["backbone/templates/devices/device"]
  events:
    'click #delete': 'delete'
    'click #create_visit': 'createVisit'

  initialize: ->
    @model.on('sync', () =>
      @render()
    )

  delete: ->
    @model.destroy(
      success: (model) ->
        console.log 'deleted:'
        console.log model.toJSON()
      error: (model, response) ->
        console.log response
    )
  createVisit: ->
    settings = {
      dataType: 'json',
      success: (response) ->
        console.log response
      error: (response) ->
        console.log response
      data: {
        user_id: @model.get 'user_id'
        device_id: @model.id
      }
    }
    $.ajax '/api/signal', settings

  templateHelpers:
    getUserName: ()->
      user = app.users.get @user_id
      name = user.get 'first_name'
      name