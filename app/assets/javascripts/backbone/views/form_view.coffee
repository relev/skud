class Skud.Views.FormView extends Backbone.Marionette.ItemView
  initialize: (options) ->
    @backUrl = options.backUrl

  lock: (channel) ->
    if !@model.isNew()
      @model.save({lock: 1}, {
        success: (model) ->
          console.log 'lock:'
          console.log model.toJSON()
#          app.client.publish channel, {model:model, action:'update'}
      })
    else
      @model.save {}, {
        success: (model) ->
          console.log 'create:'
          console.log model.toJSON()
#          app.client.publish channel, {model:model, action:'create'}
      }

  unlock: (channel) ->
    @model.save({lock: 0}, {
      success: (model) ->
        console.log 'unlock:'
        console.log model.toJSON()
#        app.client.publish channel, {model:model, action:'update'}
    })

  back: ->
    if typeof @backUrl != 'undefined'
      document.location.href = @backUrl
    else
      window.history.back()