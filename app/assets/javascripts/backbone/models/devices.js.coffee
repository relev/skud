class Skud.Models.Devices extends Backbone.Model
  urlRoot: '/devices'

  defaults:
    device_type: null
    user: null
    session_key: null
    name: null
    device_key: null

class Skud.Collections.DevicesCollection extends Backbone.Collection
  model: Skud.Models.Devices
  url: '/devices'
