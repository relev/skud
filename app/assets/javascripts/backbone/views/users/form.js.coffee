Skud.Views.Users ||= {}

class Skud.Views.Users.FormUser extends Skud.Views.FormView
  template: JST["backbone/templates/users/form"]
  events:
    'click #ok': 'ok'
    'click #delete': 'delete'
    'click #close': 'closeForm'

  initialize: (options) ->
    @backUrl = options.backUrl

  onShow: ->
    rivets.bind(@$el, {model: @model})
    @lock()

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

  closeForm: ->
    if @model.isNew()
      @delete()
    else
      @unlock()
    @back()

  delete: ->
    @model.destroy(
      success: (model, response) =>
        console.log 'deleted:'
        console.log model.toJSON()
        @back()
      error: (model) ->
        console.log 'not deleted:'
        console.log model.toJSON()
    )



