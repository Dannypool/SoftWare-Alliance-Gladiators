window.GestionFe =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new GestionFe.Routers.Gestions()
    Backbone.history.start()

$(document).ready ->
  GestionFe.initialize()
