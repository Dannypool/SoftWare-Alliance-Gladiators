class GestionFe.Collections.Cursos extends Backbone.Collection
  url: 'api/courses'
  model: GestionFe.Models.Curso
  cambiarUrl: ->
    @url = 'api/cursos_habilitados'