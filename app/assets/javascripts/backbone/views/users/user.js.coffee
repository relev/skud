Skud.Views.Users ||= {}

class Skud.Views.Users.UserView extends Backbone.Marionette.ItemView
  tagName: 'tr'
  template: JST["backbone/templates/users/user"]
  events:
    'click #delete': 'delete'

  initialize: ->
    @model.on('sync', () =>
      @render()
    )

  delete: ->
    @model.destroy(
      success: (model) ->
        console.log 'deleted:'
        console.log model.toJSON()
      error: (model) ->
        console.log 'not deleted:'
        console.log model.toJSON()
    )