# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  window.app = new Skud.Applications.ClockFaceApp()
  app.visits = new Skud.Collections.VisitsCollection
  app.visits.fetch {
    success: () ->
      app.devices = new Skud.Collections.DevicesCollection
      app.devices.fetch {
        success: () ->
          app.users = new Skud.Collections.UsersCollection
          app.users.fetch {
            success: () ->
              app.start()
          }
      }
  }


