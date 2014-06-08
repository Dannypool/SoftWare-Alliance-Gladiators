class GestionFe.Views.CursosVigentes extends Backbone.View
  template: JST['gestions/cursos/cursos_vigentes']
  templateRow: JST['gestions/cursos/row_curso_vigente']
  templateSelectTipoEducacion: JST['gestions/catalogos/select_tipo_educacion']
  templateSelectMunicipio: JST['gestions/catalogos/select_municipio']
  el: '#panelContenido'
  cursos: null
  tiposEducacion: null
  municipios: null
  events:
    'click .btn-editar': 'showModal'
  initialize: ->
    @render()
    @selectCurso = @$('.select-cursos')
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

  getCursos: (cursos) ->
    @cursos = cursos
    console.log @cursos

  getTipoEducacion: (tipos) ->
    @tiposEducacion = tipos
    @$('.select-tipo-educacion').empty()
    @tiposEducacion.each(@renderTipoEducacion, this)

  renderTipoEducacion: (tipo) ->
    html = @templateSelectTipoEducacion(tipo: tipo.toJSON())
    $('.select-tipo-educacion').append(html)

  getMunicipios: (municipios) ->
    @municipios = municipios
    @$('.select-municipios').empty()
    @municipios.each(@renderMunicipio, this)

  renderMunicipio: (municipio) ->
    html = @templateSelectMunicipio(municipio: municipio.toJSON())
    $('.select-municipios').append(html)