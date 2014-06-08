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
    'clicl .editar-curso-modal': 'editarCurso'
  initialize: ->
    @render()
    this.$('.customhourpicker').datetimepicker({pickTime: false, format: 'DD-MM-YYYY', language: 'es'})
    @selectCurso = @$('.select-cursos')
    @collection.on('reset', @addAll, this)
    this.listenTo(this.collection, 'add', this.renderCursoVigente)

  render: ->
    this.$el.html(@template())
    this

  addAll: ->
    @$('.tabla-cursos-vigentes').empty()
    @collection.each(@renderCursoVigente, this)

  renderCursoVigente: (curso) ->
    #view = new GestionFe.Views.RowCursosVigente
    modeloAux = curso.toJSON()
    idCurso = modeloAux.course_id
    console.log idCurso.toString()
    console.log @catCursos
    modeloAux["nombre"] = @catCursos.get(modeloAux.course_id).get("nombre")
    modeloAux["tipo"] =  @tiposEducacion.get(modeloAux.education_type_id).get("nombre")
    html = @templateRow(curso: modeloAux )
    $('.tabla-cursos-vigentes').append(html)

  showModal: (e) ->
    @renderModal(e.target.id)
    $('#editarCurso').modal('show')

  renderModal:(id_curso) ->
    curso = @collection.get(id_curso).toJSON()
    $('.select-cursos-modal').val(curso.course_id)
    $('.select-tipo-modal').val(curso.education_type_id)
    @$('.select-municipios-modal').val(curso.municipality_id)
    @$('.select-idioma-modal').val(curso.language_id)
    @$('.hora-inicio-modal').val(curso.fecha_inicio)
    @$('.hora-fin-modal').val(curso.fecha_fin)

  getCursos: (cursos) ->
    @cursos = cursos
    console.log @cursos

  getTipoEducacion: (tipos) ->
    @tiposEducacion = tipos
    @$('.select-tipo-educacion').empty()
    $('.select-tipo-modal').empty()
    @tiposEducacion.each(@renderTipoEducacion, this)


  renderTipoEducacion: (tipo) ->
    html = @templateSelectTipoEducacion(tipo: tipo.toJSON())
    $('.select-tipo-educacion').append(html)
    $('.select-tipo-modal').append(html)

  getMunicipios: (municipios) ->
    @municipios = municipios
    @$('.select-municipios').empty()
    @$('.select-municipios-modal').empty()
    @municipios.each(@renderMunicipio, this)

  renderMunicipio: (municipio) ->
    html = @templateSelectMunicipio(municipio: municipio.toJSON())
    $('.select-municipios').append(html)
    $('.select-municipios-modal').append(html)

  getIdiomas: (idiomas) ->
    @idiomas = idiomas
    @$('.select-idioma').empty()
    @$('.select-idioma-modal').empty()
    @idiomas.each(@renderIdioma, this)

  renderIdioma: (idioma) ->
    html = @templateSelectIdioma(idioma: idioma.toJSON())
    $('.select-idioma').append(html)
    $('.select-idioma-modal').append(html)

  getCursos: (cursos) ->
    @catCursos = cursos
    @$('.select-cursos').empty()
    @$('.select-cursos-modal').empty()
    @catCursos.each(@renderCurso, this)

  renderCurso: (curso) ->
    html = @templateSelectCurso(curso: curso.toJSON())
    $('.select-cursos').append(html)
    $('.select-cursos-modal').append(html)

  guardarCurso: (e)->
    that =this
    e.preventDefault()
    atributos = {
      course_id: parseInt($('.select-cursos').val(),10),
      course_status_id: 1,
      education_type_id: parseInt($('.select-tipo-educacion').val(),10),
      language_id: parseInt($('.select-idioma').val(),10),
      municipality_id:  parseInt($('.select-municipios').val(),10),
      no_asistencias: 30,
      fecha_inicio: $('#input-fecha-inicio').val()
      fecha_fin: $('#input-fecha-fin').val()
    }
    @collection.create atributos,
      wait: true
      success: ->
        $('#input-fecha-inicio').val("")
        $('#input-fecha-fin').val("")

  editarCurso: ->
    atributos = {
      course_id: parseInt($('.select-cursos-modal').val(),10),
      course_status_id: 1,
      education_type_id: parseInt($('.select-tipo-modal').val(),10),
      language_id: parseInt(@$('.select-idioma-modal').val(),10),
      municipality_id:  parseInt(@$('.select-municipios-modal').val(),10),
      no_asistencias: 30,
      fecha_inicio: $('.hora-inicio-modal').val()
      fecha_fin: $('.hora-fin-modal').val(curso.fecha_fin)
    }
    console.log atributos

