Skud.Views.Visits ||= {}

class Skud.Views.Visits.FormVisit extends Skud.Views.FormView
  template: JST["backbone/templates/visits/form"]
  events:
    'click #delete': 'delete'
    'click #close': 'closeForm'
    'click #start': 'start'
    'click #complete': 'complete'

  onShow: ->
    @lock('/visit_change')

  closeForm: ->
    @unlock('/visit_change')
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

  start: ->
    console.log('visit:start')
    @closeForm()

  complite: ->
    console.log('visit:complite')
    @closeForm()

  templateHelpers:
    user: () ->
      return app.users.get @user_id


