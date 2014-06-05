class GestionFe.Views.RegistroAspirantes extends Backbone.View
  template: JST['gestions/registro_aspirantes']
  events:
    'click input.nivelEducacion': 'checkNivelEducacion'
    'change #select-estado' : 'resetMunicipio'
    'change #select-municipio' : 'resetLocalidad'
    'click .btn-save': 'guardarAspirante'
  localidades: null
  municipios: null
  estados: null
  initialize:() ->
    @render()
    @nivelMedia  = this.$('#mediaSuperior')
    @nivelSuperior  = this.$('#superior')
    @selectEstado = this.$('#select-estado')
    @selectMunicipio = this.$('#select-municipio')
    @selectLocalidad = this.$('#select-localidad')
    this.$('#fecha_nac_aic').datetimepicker({pickTime: false, format: 'DD/MM/YYYY', language: 'es'})
    this.$('#fecha_fin_estudios').datetimepicker({pickTime: false, format: 'DD/MM/YYYY', language: 'es'})

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
      @nivelMedia.hide()
      @nivelSuperior.show()

  setMunicipios: (id_estado) ->
    that = this
    @selectMunicipio.empty()
    municipiosAux = @municipios.where({state_id: id_estado})
    $.each municipiosAux, (i) ->
      that.renderMunicipios municipiosAux[i]


  renderMunicipios: (municipio)->
    municipioAux = municipio.get("municipio")
    idMunicipio = municipio.get("id")
    html = "<option value='#{idMunicipio}'> #{municipioAux}</option>"
    @selectMunicipio.append(html)

  setEstados: () ->
    @selectEstado.empty()
    @estados.each(@renderEstados, this)

  renderEstados: (estado)->
    estadoAux = estado.get("estado")
    idEstado= estado.get('id')
    html = "<option value='#{idEstado}'> #{estadoAux}</option>"
    @selectEstado.append(html)

  setLocalidades: (id_municipio) ->
    that = this
    @selectLocalidad.empty()
    localidadesAux = @localidades.where({municipality_id: id_municipio})
    $.each localidadesAux, (i) ->
      that.renderLocalidades localidadesAux[i]

  renderLocalidades: (localidad)->
    localidadAux = localidad.get("localidad")
    idLocalidad = localidad.get("id")
    html = "<option value='#{idLocalidad}'> #{localidadAux}</option>"
    @selectLocalidad.append(html)

  getLocalidades: (localidades)->
    @localidades = localidades
    @setLocalidades(1)

  getEstados: (estados)->
    @estados = estados
    @setEstados()

  getMunicipios: (municipios)->
    @municipios = municipios
    @setMunicipios(1)

  resetMunicipio: ->
    @setMunicipios parseInt(@selectEstado.val(),10)
    @resetLocalidad()

  resetLocalidad: ->
    @setLocalidades parseInt(@selectMunicipio.val(),10)

  guardarAspirante: ->
    console.log(this.$('#nombre_aic').val())

