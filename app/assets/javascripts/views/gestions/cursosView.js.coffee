class GestionFe.Views.Cursos extends Backbone.View
  template: JST['gestions/cursos']
  el: '#panelContenido'
  events:
    'submit #form-curso': 'saveCurso'
  municipios: null
  initialize: ->
    @render()
    @collection.on('reset', @addAll, this)
    this.listenTo(this.collection, 'add', this.renderCat)

  render: ->
    this.$el.html(@template())
    @addAll()
    this

  reset: ->
    this

  addAll: ->
    @$('#tabla-cursos').empty()
    @collection.each(@renderCat, this)

  renderCat: (curso)->
    view = new GestionFe.Views.RowCursos(model: curso)
    $('#tabla-cursos').append(view.$el)

  saveCurso: (e) ->
    e.preventDefault()
    nombre = @$('#nombre_curso').val()
    descripcion = @$('#descripcion_curso').val()
    attributes = {
      nombre: nombre,
      descripcion: descripcion
    }
    @collection.create attributes,
      wait: true
      success: ->
        @$('#nombre_curso').val('')
        @$('#descripcion_curso').val('')