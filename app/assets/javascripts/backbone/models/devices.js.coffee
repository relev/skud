class Skud.Models.Device extends Backbone.Model
  urlRoot: '/devices'

  defaults:
    device_type: null
    user_id: null
    session_key: null
    name: null
    device_key: null

class Skud.Collections.DevicesCollection extends Backbone.Collection
  model: Skud.Models.Device
  url: '/devices'
