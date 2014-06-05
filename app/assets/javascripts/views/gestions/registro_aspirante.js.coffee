class GestionFe.Views.RegistroAspirantes extends Backbone.View
  template: JST['gestions/registro_aspirantes']
  events:
    'click input.nivelEducacion': 'checkNivelEducacion'
  initialize:() ->
    @render()
    @nivelMedia  = this.$('#mediaSuperior')
    @nivelSuperior  = this.$('#superior')
    @selectMunicipio  = this.$('.municipio')
    this.$('#fecha_nac_aic').datetimepicker({pickTime: false, format: 'DD/MM/YYYY', language: 'es'})
    @showNivelEducacion("nivelSecundaria")

  render: ()->
    $(@el).html(@template)
    this

  checkNivelEducacion: (e)->
    opcion = e.currentTarget.id
    @showNivelEducacion(opcion)


  showNivelEducacion: (opcion)->
    if opcion == "nivelSecundaria"
      @nivelMedia.hide()
      @nivelSuperior.hide()
    if opcion == "nivelMediaSuperior"
      @nivelMedia.show()
      @nivelSuperior.hide()
    if opcion == "nivelSuperior"
      @nivelMedia.show()
      @nivelSuperior.show()

  allMunicipios: (municipios) ->
    this.$('#select-municipio').empty()
    municipios.each(@renderMunicipios, this)

  renderMunicipios: (municipio)->
    municipioAux = municipio.get("municipio")
    html = "<option> #{municipioAux}</option>"
    this.$('#select-municipio').append(html)

  allEstados: (estados) ->
    this.$('#select-estado').empty()
    estados.each(@renderEstados, this)

  renderEstados: (estado)->
    estadoAux = estado.get("estado")
    html = "<option> #{estadoAux}</option>"
    console.log(html)
    this.$('#select-estado').append(html)

  allLocalidades: (localidades) ->
    this.$('#select-localidad').empty()
    localidades.each(@renderLocalidades, this)

  renderLocalidades: (localidad)->
    localidadAux = localidad.get("localidad")
    html = "<option> #{localidadAux}</option>"
    this.$('#select-localidad').append(html)
