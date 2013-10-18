Skud.Views.Devices ||= {}

class Skud.Views.Devices.FormDevice extends Backbone.Marionette.ItemView
  template: JST["backbone/templates/devices/form"]
  events:
    'click #ok': 'ok'
    'click #delete': 'delete'
    'click #close': 'closeForm'

  initialize: (options) ->
    @backUrl = options.backUrl

  back: ->
    if typeof @backUrl != 'undefined'
      document.location.href = @backUrl
    else
      window.history.back()

  onShow: ->
    rivets.bind(@$el, {model: @model})

  closeForm: ->
    @delete if @model.isNew()
    @back()

  ok: () ->
    @model.save {}, {
      success: (model) =>
        console.log 'saved:'
        console.log model.toJSON()
        @closeForm()
      error: (model) ->
        console.log 'not saved:'
        console.log model.toJSON()
    }

  delete: () ->
    @model.destroy(
      success: (model, response) =>
        console.log 'deleted:'
        console.log model.toJSON()
        @back()
      error: (model, response) ->
        console.log response
    )

  templateHelpers:
    getUsers: ()->
      users = app.users.toJSON()
      users



