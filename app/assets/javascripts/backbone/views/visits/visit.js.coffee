Skud.Views.Visits ||= {}

class Skud.Views.Visits.VisitView extends Skud.Views.ItemView
  tagName:'tr'
  template: JST["backbone/templates/visits/visit"]
  events:
    'click #delete':'delete'

  delete: ->
    @model.destroy(
      success: (model) ->
        app.client.publish('/visit_delete', model.id)
        console.log 'deleted:'
        console.log model.toJSON()
      error: (model, response) ->
        console.log response
    )

