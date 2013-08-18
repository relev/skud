class Skud.Views.VisitView extends Backbone.Marionette.ItemView
  tagName:'li'
  className:'visit'
  template: _.template('<%=user.first_name%>')
  onRender: () ->
    this.delegateEvents({
      'click':'click'
    })
  click: () ->
    document.location.href = '#visit/'+this.model.get('session_key')