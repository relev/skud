Skud.Views.Visits ||= {}

class Skud.Views.Visits.FormVisit extends Skud.Views.FormView
  template: JST["backbone/templates/visits/form"]
  events:
    'click #ok':'closeForm'
    'click #delete':'delete'
    'click #close':'closeForm'
    'click #start':'start'
    'click #complite':'complite'

  onShow: ->
    rivets.bind(@$el,{model:@model})
    @lock('visit_change')

  closeForm: ->
    @unlock('visit_change')
    @back()

  delete: ->
    @model.destroy(
      success: (model, response) =>
        app.client.publish('/visit_delete', model.id)
        @back()
      error: (model, response) ->
        console.log response
    )

  start: ->
    console.log('visit:start')
    @closeForm()

  complite: ->
    console.log('visit:complite')
    @closeForm()

