class Skud.Views.EventsView extends Backbone.Marionette.CompositeView
  template: _.template('<%= name%>')
  itemView: Skud.Views.EventView
