Skud.Views.Users ||= {}

class Skud.Views.Users.ListView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/users/list"]
  itemViewContainer: 'tbody'
  initialize: () ->
    @itemView = Skud.Views.Users.UserView


