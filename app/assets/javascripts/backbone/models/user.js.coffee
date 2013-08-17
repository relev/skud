class Skud.Models.User extends Backbone.Model
  urlRoot: '/users'

  defaults:
    first_name: null
    last_name: null
    email: null
    gender: null
    birth_date: null

class Skud.Collections.UsersCollection extends Backbone.Collection
  model: Skud.Models.User
  url: '/users'

