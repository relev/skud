class Skud.Models.Visits extends Backbone.Model
  urlRoot: '/visits'

  defaults:
    user: null
    device: null
    session_key: null
    closed_at: null

class Skud.Collections.VisitsCollection extends Backbone.Collection
  model: Skud.Models.Visits
  url: '/visits'
