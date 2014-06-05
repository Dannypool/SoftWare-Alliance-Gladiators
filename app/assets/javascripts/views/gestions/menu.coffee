class GestionFe.Views.Menu extends Backbone.View

  template: JST['gestions/menu']

  render: ->
    $(@el).html(@template)
    this
