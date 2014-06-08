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

    idiomas = new GestionFe.Collections.Idiomas
    tipoEducacion = new GestionFe.Collections.TiposEscuelas
    aspirantes = new GestionFe.Collections.Aspirantes

    view = new GestionFe.Views.RegistroAspirantes()


    aspirantesFetched = new $.Deferred()
    aspirantes.fetch success: ->
      aspirantesFetched.resolve()
    aspirantesFetched.done ->
      view = new GestionFe.Views.RegistroAspirantes(collection: aspirantes)

      that.municipiosFetched.done ->
        view.getMunicipios(that.municipios)
      that.estadosFetched.done ->
        view.getEstados(that.estados)
      that.localidadesFetched.done ->
        view.getLocalidades(that.localidades)
        that.contenido.html(view.$el)

      tipoEducacionFetched = new $.Deferred()
      tipoEducacion.fetch success: ->
        tipoEducacionFetched.resolve()
      tipoEducacionFetched.done ->
        view.getTipoEducacion tipoEducacion

      idiomasFetched = new $.Deferred()
      idiomas.fetch success: ->
        idiomasFetched.resolve()
      idiomasFetched.done ->
        view.getIdiomas idiomas



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
    cursosVigentes = new GestionFe.Collections.CursosVigentes
    cursosVigentesFetched = new $.Deferred()
    cursosVigentes.fetch success: ->
      cursosVigentesFetched.resolve()
    cursosVigentesFetched.done ->

      view = new GestionFe.Views.CursosVigentes(collection: cursosVigentes)

      cursos = new GestionFe.Collections.Cursos
      cursos.cambiarUrl()
      catTipoEducacion = new GestionFe.Collections.TiposEducacion
      idiomas = new GestionFe.Collections.Idiomas

      catTipoEducacionFetched = new $.Deferred()
      catTipoEducacion.fetch success: ->
        catTipoEducacionFetched.resolve()
      catTipoEducacionFetched.done ->
        view.getTipoEducacion catTipoEducacion

      idiomasFetched = new $.Deferred()
      idiomas.fetch success: ->
        idiomasFetched.resolve()
      idiomasFetched.done ->
        view.getIdiomas idiomas

      cursosFetched = new $.Deferred()
      cursos.fetch success: ->
        cursosFetched.resolve()
      cursosFetched.done ->
        view.getCursos cursos
        view.addAll()

      that.municipiosFetched.done ->
        view.getMunicipios(that.municipios)