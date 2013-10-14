class Skud.Models.User extends Backbone.Model
#  urlRoot: '/users'

  defaults:
    first_name: ""
    last_name: ""
    email: null
    gender: null
    birth_date: null
    lock: 0

class Skud.Collections.UsersCollection extends Backbone.Collection
  model: Skud.Models.User
  url: '/users'

