Skud.Views.Devices ||= {}

class Skud.Views.Devices.ListView extends Backbone.Marionette.CompositeView
  template: JST["backbone/templates/devices/list"]
  itemViewContainer: 'tbody'
  initialize: () ->
    @itemView = Skud.Views.Devices.DeviceView


