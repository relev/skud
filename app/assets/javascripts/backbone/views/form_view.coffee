class Skud.Views.FormView extends Backbone.Marionette.ItemView
  initialize: (options) ->
    @backUrl = options.backUrl

  lock: (faye_channel) ->
    if !@model.isNew()
      @model.save({lock: 1}, {
        success: (model) ->
          app.client.publish(faye_channel, model.id)
      })

  unlock: (faye_channel) ->
    @model.save({lock: 0}, {
      success: (model) ->
        app.client.publish(faye_channel, model.id)
    })

  back: ->
    if typeof @backUrl != 'undefined'
      document.location.href = @backUrl
    else
      window.history.back()