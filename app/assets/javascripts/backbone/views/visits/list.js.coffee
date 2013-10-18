Skud.Views.Visits ||= {}

class Skud.Views.Visits.ListView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/visits/list"]
  itemViewContainer: 'tbody'
  initialize: () ->
    @itemView = Skud.Views.Visits.VisitView
    app.client.subscribe '/visit', (message) ->
      console.log message
      model = JSON.parse message.model
      switch message.action
        when 'open'
          model = new Skud.Models.Visit model
          app.visits.add model
          app.modal.show new Skud.Views.Visits.OpenVisit model: model
          $('#modal').foundation('reveal', 'open')
        when 'close'
          model = app.visits.get model.id
          app.modal.show new Skud.Views.Visits.CloseVisit model: model
          $('#modal').foundation('reveal', 'open')






