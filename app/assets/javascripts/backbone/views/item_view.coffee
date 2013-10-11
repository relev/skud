class Skud.Views.ItemView extends Backbone.Marionette.ItemView
  initialize: ->
    @model.on('sync', () =>
      @render()
    )
