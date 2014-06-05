class GestionFe.Routers.Gestions extends Backbone.Router
  routes:
    '': 'index'
    'Registro_Aspirante': 'show_registroAspirante'
    'Modificar_Aspirante': 'show_modificar_aspirante'
    'Cursos': 'showCursos'

  initialize: ->
    view = new GestionFe.Views.Menu()
    $('#menuLateral').html(view.render().el)
    @contenido = $('#panelContenido')
    #@cursos = new GestionFe.Collections.Cursos()
    #@cursos.fetch()
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

#  showCursos: ->
 #   view = new GestionFe.Views.Cursos(collection: @cursos)
    #@catCursos.$el.show()

