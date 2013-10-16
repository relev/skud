Skud.Views.Users ||= {}

class Skud.Views.Users.FormUser extends Skud.Views.FormView
  template: JST["backbone/templates/users/form"]
  events:
    'click #ok': 'closeForm'
    'click #delete': 'delete'
    'click #close': 'closeForm'

  onShow: ->
    rivets.bind(@$el, {model: @model})
    @lock()

  closeForm: ->
    @unlock()
    @back()

  delete: ->
    @model.destroy(
      success: (model, response) =>
        console.log 'deleted:'
        console.log model.toJSON()
        @back()
      error: (model, response) ->
        console.log response
    )



