Skud.Views.Users ||= {}

class Skud.Views.Users.ListView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/users/list"]
  itemViewContainer: 'tbody'
  events:
    'click #newVisit': 'createVisit'
  initialize: () ->
    @itemView = Skud.Views.Users.UserView
  createVisit: ->
#    app.client.publish '/visit', {action:'create'}


