class Skud.Views.FormView extends Backbone.Marionette.ItemView
  initialize: (options) ->
    @backUrl = options.backUrl

  lock: () ->
    if !@model.isNew()
      @model.save({lock: 1}, {
        success: (model) ->
          console.log 'lock:'
          console.log model.toJSON()
      })

  unlock: () ->
    @model.save({lock: 0}, {
      success: (model) ->
        console.log 'unlock:'
        console.log model.toJSON()
    })

  back: ->
    if typeof @backUrl != 'undefined'
      document.location.href = @backUrl
    else
      window.history.back()