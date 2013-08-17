class Skud.Models.DeviceTypes extends Backbone.Model
  urlRoot: '/device_types'

  defaults:
    name: null

class Skud.Collections.DeviceTypesCollection extends Backbone.Collection
  model: Skud.Models.DeviceTypes
  url: '/device_types'
