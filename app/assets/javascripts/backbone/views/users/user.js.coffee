Skud.Views.Users ||= {}

class Skud.Views.Users.UserView extends Skud.Views.ItemView
  tagName: 'tr'
  template: JST["backbone/templates/users/user"]
  events:
    'click #delete': 'delete'
    'click #createVisit': 'createUserVisit'

  delete: ->
    @model.destroy(
      success: (model) ->
        console.log 'deleted:'
        console.log model.toJSON()
      error: (model, response) ->
        console.log response
    )
  createUserVisit: ->
#    app.client.publish '/visit', {user_id:@model.id, action:'create_with_user'}