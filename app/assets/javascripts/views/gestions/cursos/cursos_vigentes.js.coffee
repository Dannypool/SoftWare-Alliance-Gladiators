class GestionFe.Views.CursosVigentes extends Backbone.View
  template: JST['gestions/cursos/cursos_vigentes']
  templateRow: JST['gestions/cursos/row_curso_vigente']
  templateSelectTipoEducacion: JST['gestions/catalogos/select_tipo_educacion']
  templateSelectMunicipio: JST['gestions/catalogos/select_municipio']
  templateSelectIdioma: JST['gestions/catalogos/select_idioma']
  templateSelectCurso: JST['gestions/catalogos/select_cat_curso']
  el: '#panelContenido'
  cursos: null
  tiposEducacion: null
  municipios: null
  idiomas: null
  catCursos: null
  events:
    'click .btn-editar': 'showModal'
    'click .btn-save': 'guardarCurso'
  initialize: ->
    @render()
    this.$('.customhourpicker').datetimepicker({pickTime: false, format: 'DD/MM/YYYY', language: 'es'})
    @selectCurso = @$('.select-cursos')
    @collection.on('reset', @addAll, this)
    this.listenTo(this.collection, 'add', this.renderCursoVigente)

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

  getIdiomas: (idiomas) ->
    @idiomas = idiomas
    @$('.select-idioma').empty()
    @idiomas.each(@renderIdioma, this)

  renderIdioma: (idioma) ->
    html = @templateSelectIdioma(idioma: idioma.toJSON())
    $('.select-idioma').append(html)

  getCursos: (cursos) ->
    @catCursos = cursos
    @$('.select-cursos').empty()
    @catCursos.each(@renderCurso, this)

  renderCurso: (curso) ->
    html = @templateSelectCurso(curso: curso.toJSON())
    $('.select-cursos').append(html)

  guardarCurso: (e)->
    e.preventDefault()
    atributos = {
      course_id: $('.select-idioma').val(),
      course_status_id: 1,
      education_type_id: $('.select-tipo-educacion').val(),
      language_id: $('.select-idioma').val(),
      municipality_id: $('.select-municipios').val(),
      no_asistencias: 30,
      fecha_inicio: $('#input-fecha-inicio').val()
      fecha_fin: $('#input-fecha-fin').val()
    }
    console.log atributos
