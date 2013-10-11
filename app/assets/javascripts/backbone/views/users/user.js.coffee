Skud.Views.Users ||= {}

class Skud.Views.Users.UserView extends Skud.Views.ItemView
  tagName:'tr'
  template: JST["backbone/templates/users/user"]
  events:
    'click #delete':'delete'

  delete: ->
    @model.destroy(
      success: (model) ->
        app.client.publish('/user_delete', model.id)
        console.log 'deleted:'
        console.log model.toJSON()
      error: (model, response) ->
        console.log response
    )