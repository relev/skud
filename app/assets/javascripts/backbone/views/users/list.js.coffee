Skud.Views.Users ||= {}

class Skud.Views.Users.ListView extends Skud.Views.CompositeView
  template: JST["backbone/templates/users/list"]
  itemViewContainer: 'tbody'
  itemView: Skud.Views.Users.User


