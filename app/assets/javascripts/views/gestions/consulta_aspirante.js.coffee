class GestionFe.Views.ConsultarAspirante extends Backbone.View
  template: JST['gestions/consulta_aspirante']

  events:
    'submit': 'buscarAspirante'

  render: ->
    $(@el).html(@template)
    this

  buscarAspirante: (event) ->
    event.preventDefault()
    alert "hola"