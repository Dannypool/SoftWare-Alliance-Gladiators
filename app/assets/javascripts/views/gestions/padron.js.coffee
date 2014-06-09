class GestionFe.Views.Padron extends Backbone.View
  template: JST['gestions/padron']

  el: '#contenido'
  events:
    'submit #form-curso': 'saveCurso'
  initialize: ->
    @render()


  render: ->
    this.$el.html(@template())
    this