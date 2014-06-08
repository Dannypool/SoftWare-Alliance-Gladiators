class GestionFe.Views.RowCursos extends Backbone.View

  template: JST['gestions/row_curso_cat']
  tagName: 'tr'
  opcion: 'editar'
  events:
    'click .btn-editar': 'editCurso'
    'click .btn-cancelar': 'cambioOpcion'
    'click .btn-guardar': 'actualizarCurso'
    'click .btn-habilitar': 'habilitarCurso'

  initialize: ->
    @render()
    @$btnEditar = this.$('.btn-editar');
    @$btnGuardar = this.$('.btn-guardar');
    @$btnCancelar = this.$('.btn-cancelar');
    @$pHabilitado = this.$('.habilitado-curso');
    @$nombre = @$('.nombre-curso')
    @$descripcion = @$('.descripcion-curso')
    @$btnGuardar.hide();
    @$btnCancelar.hide();
    @model.on('change:status',@cambioEstado, this)
    @model.on('change',@cambioOpcion, this)
  render: ->
    $(@el).html(@template(curso: @model.toJSON() ))
    this

  editCurso: (e) ->
    e.preventDefault()
    @cambioOpcion()

  cambioOpcion: ->
    console.log "cambiar"
    if this.opcion == 'editar'
      this.opcion = 'guardar';
      this.$btnEditar.hide();
      this.$btnGuardar.show();
      this.$btnCancelar.show();
      @$nombre.prop('disabled', false);
      @$descripcion.prop('disabled', false);
    else
      this.opcion = 'editar';
      this.$btnEditar.show();
      this.$btnGuardar.hide();
      this.$btnCancelar.hide();
      @$nombre.prop('disabled', true);
      @$descripcion.prop('disabled', true);
      @$nombre.val(@model.get('nombre'))
      @$descripcion.val(this.model.get('description'))

  actualizarCurso: ->
    nombre = @$nombre.val()
    descripcion = @$descripcion.val()
    attributes = {
      nombre: nombre,
      description: descripcion
    }
    @model.save attributes,
      wait: true
      success: -> console.log "editado"

  habilitarCurso: ->
    if @model.get('status')
      @model.set({status: false}, silence: true)
    else
      @model.set({status: true}, silence: true)
    @model.save
      wait: true
      success: -> console.log "habilitado"

  cambioEstado: ->
    console.log @model.get('status')
    if @model.get('status')
      @$pHabilitado.text("Habilitado")
    else
      @$pHabilitado.text('Deshabilitado')