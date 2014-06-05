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
    @estados = new GestionFe.Collections.Municipios
    @estados.fetch success: ->
      that.estadosFetched.resolve()

    @contenido = $('#panelContenido')

  #@Registro_Aspirante.$el.hide()
  #@catCursos = new GestionFe.Views.Cursos(collection: @cursos)

  show_registroAspirante: ->
    that = this
    @municipiosFetched.done ->
      view = new GestionFe.Views.RegistroAspirantes()
      view.allEstados(that.estados)
      view.allMunicipios(that.municipios)
      that.contenido.html(view.$el)



  #show_modificar_aspirante: ->
   # view = new GestionFe.Views.ConsultarAspirante()
    #$('#panelContenido').html(view.render().el)

#  showCursos: ->
 #   view = new GestionFe.Views.Cursos(collection: @cursos)
    #@catCursos.$el.show()

