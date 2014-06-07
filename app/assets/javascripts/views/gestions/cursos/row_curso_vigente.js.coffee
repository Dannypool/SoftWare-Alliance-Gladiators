class GestionFe.Views.RowCursosVigente extends Backbone.View

  template: JST['gestions/cursos/row_curso_vigente']
  tagName: 'tr'
  events:
    'click .btn-editar': 'showModal'

  initialize: ->
    @render()

  render: ->
    modeloAux = @model.toJSON()
    console.log( modeloAux)
    modeloAux["nombre"] = "nombre"
    modeloAux["tipo"] = "nombre tipo"
    $(@el).html(@template(curso: modeloAux ))
    this

  showModal: (e)->
    console.log e