Skud.Views.Visits ||= {}

class Skud.Views.Visits.ListView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/visits/list"]
  itemViewContainer: 'tbody'
  initialize: () ->
    @itemView = Skud.Views.Visits.VisitView





