class GestionFe.Views.CursosVigentes extends Backbone.View
  template: JST['gestions/cursos/cursos_vigentes']
  el: '#panelContenido'

  initialize: ->
    console.log("hola")
    @render()
    @collection.on('reset', @addAll, this)
    #this.listenTo(this.collection, 'add', this.renderCat)

  render: ->
    this.$el.html(@template())
    @addAll()
    this

  addAll: ->
    @collection.each(@renderCursoVigente, this)

  renderCursoVigente: (curso) ->
    console.log curso