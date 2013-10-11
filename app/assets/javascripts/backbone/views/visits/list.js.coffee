Skud.Views.Visits ||= {}

class Skud.Views.Visits.ListView extends Skud.Views.CompositeView
  template: JST["backbone/templates/visits/list"]
  itemViewContainer: 'tbody'
  itemView: Skud.Views.Visits.Visit


