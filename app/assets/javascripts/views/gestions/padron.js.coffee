class GestionFe.Views.Padron extends Backbone.View
  template: JST['gestions/padron']
  templateFigura: JST['gestions/padron_figura']
  el: '#contenido'
  idiomas: null
  events:
    'submit #form-curso': 'saveCurso'
  initialize: ->
    @render()

  render: ->
    this.$el.html(@template())
    @addAll()
    this

  addAll: ->

    @collection.each(@renderFigura, this)

  renderFigura: (figura)->

    figuraAux = figura.toJSON()
    #figuraAux["nombreLengua"] = @idiomas.get(figuraAux.language_id).get("nombre")
    html = @templateFigura(figura: figuraAux )
    @$('#figuras').append(html)

  getIdiomas: (idiomas) ->
    @idiomas = idiomas