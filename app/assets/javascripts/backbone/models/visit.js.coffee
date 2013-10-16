class Skud.Models.Visit extends Backbone.Model
  #  urlRoot: '/visits'

  defaults:
    user_id: null
    device_id: null
    session_key: null
    closed_at: null
    created_at: null
    lock: 0

class Skud.Collections.VisitsCollection extends Backbone.Collection
  model: Skud.Models.Visit
  url: '/visits'
