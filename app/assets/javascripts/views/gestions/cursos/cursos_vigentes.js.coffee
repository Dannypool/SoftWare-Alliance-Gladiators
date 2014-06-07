class GestionFe.Views.CursosVigentes extends Backbone.View
  template: JST['gestions/cursos/cursos_vigentes']
  templateRow: JST['gestions/cursos/row_curso_vigente']
  el: '#panelContenido'
  events:
    'click .btn-editar': 'showModal'
  initialize: ->
    @render()
    @collection.on('reset', @addAll, this)
    #this.listenTo(this.collection, 'add', this.renderCat)

  render: ->
    this.$el.html(@template())
    @addAll()
    this

  addAll: ->
    @$('.tabla-cursos-vigentes').empty()
    @collection.each(@renderCursoVigente, this)

  renderCursoVigente: (curso) ->
    #view = new GestionFe.Views.RowCursosVigente
    modeloAux = curso.toJSON()
    console.log( modeloAux)
    modeloAux["nombre"] = "nombre"
    modeloAux["tipo"] = "nombre tipo"
    html = @templateRow(curso: modeloAux )
    $('.tabla-cursos-vigentes').append(html)

  showModal: (e) ->
    @renderModal(e.target.id)
    $('#editarCurso').modal('show')

  renderModal:(id_curso) ->
    curso = @collection.get(id_curso).toJSON()
    curso["nombre"] = "nombre"
    $('#editar_nombre_curso').val(curso.nombre)
