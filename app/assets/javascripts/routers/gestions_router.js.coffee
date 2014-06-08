class GestionFe.Routers.Gestions extends Backbone.Router
  routes:
    '': 'index'
    'Registro_Aspirante': 'show_registroAspirante'
    'Modificar_Aspirante': 'show_modificar_aspirante'
    'Cursos': 'showCursos'
    'cursos_vigentes': 'showCursosVigentes'

  initialize: ->
    view = new GestionFe.Views.Menu()
    $('#menuLateral').html(view.render().el)
    @contenido = $('#panelContenido')
    that = this
    @municipiosFetched = new $.Deferred()
    @municipios = new GestionFe.Collections.Municipios
    @municipios.fetch success: ->
      that.municipiosFetched.resolve()
    @estadosFetched = new $.Deferred()
    @estados = new GestionFe.Collections.Estados
    @estados.fetch success: ->
      that.estadosFetched.resolve()
    @localidadesFetched = new $.Deferred()
    @localidades = new GestionFe.Collections.Localidades
    @localidades.fetch success: ->
      that.localidadesFetched.resolve()
    @contenido = $('#panelContenido')

  #@Registro_Aspirante.$el.hide()
  #@catCursos = new GestionFe.Views.Cursos(collection: @cursos)

  show_registroAspirante: ->
    that = this
    view = new GestionFe.Views.RegistroAspirantes()
    @municipiosFetched.done ->
      view.getMunicipios(that.municipios)
    @estadosFetched.done ->
      view.getEstados(that.estados)
    @localidadesFetched.done ->
      view.getLocalidades(that.localidades)
      that.contenido.html(view.$el)



  show_modificar_aspirante: ->
    view = new GestionFe.Views.ConsultarAspirante()
    @contenido.html(view.render().el)

  showCursos: ->

    cursos = new GestionFe.Collections.Cursos
    cursosFetched = new $.Deferred()
    cursos.fetch success: ->
      cursosFetched.resolve()
    cursosFetched.done ->
      new GestionFe.Views.Cursos(collection: cursos)
    #@catCursos.$el.show()

  showCursosVigentes: ->
    that= this
    cursosVigentes = new GestionFe.Collections.CursosVigentes()
    cursosVigentes.add [
      {
        id: 1
        course_id: 1,
        municipality_id: 1,
        education_type_id: 1,
        language_id: 1,
        course_status_id: 1,
        no_asistencias: 0,
        fecha_inicio: "12/12/12",
        fecha_fin: "12/12/13"
      },
      {
        id: 2
        course_id: 2,
        municipality_id: 1,
        education_type_id: 1,
        language_id: 1,
        course_status_id: 1,
        no_asistencias: 0,
        fecha_inicio: "12/12/12",
        fecha_fin: "12/12/13"
      },
      {
        id: 3
        course_id: 3,
        municipality_id: 1,
        education_type_id: 1,
        language_id: 1,
        course_status_id: 1,
        no_asistencias: 0,
        fecha_inicio: "12/12/12",
        fecha_fin: "12/12/13"
      }
    ]
    console.log cursosVigentes
    view = new GestionFe.Views.CursosVigentes(collection: cursosVigentes)
    catTipoEducacion = new GestionFe.Collections.TiposEducacion
    catTipoEducacionFetched = new $.Deferred()
    catTipoEducacion.fetch success: ->
      catTipoEducacionFetched.resolve()
    catTipoEducacionFetched.done ->
      view.getTipoEducacion catTipoEducacion
    @municipiosFetched.done ->
      view.getMunicipios(that.municipios)