Skud.Views.Users ||= {}

class Skud.Views.Users.FormUser extends Skud.Views.FormView
  template: JST["backbone/templates/users/form"]
  events:
    'click #ok':'closeForm'
    'click #delete':'delete'
    'click #close':'closeForm'

  closeForm: ->
    @unlock()
    @back()

  delete: ->
    @model.destroy(
      success: (model, response) =>
        app.client.publish('/user_delete', model.id)
        @back()
      error: (model, response) ->
        console.log response
    )



