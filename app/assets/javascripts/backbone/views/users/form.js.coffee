Skud.Views.Users ||= {}

class Skud.Views.Users.FormUser extends Skud.Views.FormView
  template: JST["backbone/templates/users/form"]
  events:
    'click #ok': 'closeForm'
    'click #delete': 'delete'
    'click #close': 'closeForm'

  onShow: ->
    rivets.bind(@$el, {model: @model})
    @lock('/user')

  closeForm: ->
    @unlock('/user')
    @back()

  delete: ->
    @model.destroy(
      success: (model, response) =>
        console.log 'deleted:'
        console.log model.toJSON()
#        app.client.publish '/user', {model:model, action:'destroy'}
        @back()
      error: (model, response) ->
        console.log response
    )



