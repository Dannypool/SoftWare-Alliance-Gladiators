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
    nombre_aic = this.$('#nombre_aic').val()
    apell_pat_aic = this.$('#apell_pat_aic').val()
    apell_mat_aic = this.$('#apell_mat_aic').val()
    fecha_nac = moment(this.$('#fecha_nac').val(), "DD/MM/YYYY")
    sexo = this.$('#sexo_aic').val()
    tipo_sangre = @$('#tipo_sangre_aic').val()
    curp = @$('curp_aic').val()
    rfc = @$('#rf_aic').val()
    lugarNac = @$('#lugar_nac_aic').val()
    tipo_zona = @$('input[name=rural]:checked').val()
    lengua_indigena = @$('#lengua_indigena').val()
    calle =@$('#calle_aic').val()
    numero = @$('#numero_aic').val()
    colonia = @$('#colonia_aic').val()
    calzado = @$('#num_calzado').val()
    talla_playera = @$('#talla_playera').val()
    talla_pans = @$('#talla_pants').val()
    telefono = @$('#telefono_aic').val()
    educacionNivel = @$('input[name=nivelEstudio]:checked').val()

    tipo_secundadia = @$('#tipo-secundaria').val()
    nombre_secundadia = @$('#nombreEscuela').val()

    if educacionNivel == 1
      nivel_educacion = @$('#tipo_media').val()
      nombre_educacion = @$('#nombre_media').val()
    else if educacionNivel == 2
      nivel_educacion = @$('#tipo_media').val()
      nombre_educacion = @$('#nombre_media').val()
    else if educacionNivel == 0
      nivel_educacion = @$('#tipo-secundaria').val()
      nombre_educacion = @$('#nombreEscuela').val()

    aspirante = {
      nombre: nombre_aic,
      aPaterno: apell_pat_aic,
      aMaterno: apell_mat_aic,
      fechaNac: fecha_nac.format('DD/MM/YYYY'),
      sexo: sexo,
      tipoSangre: tipo_sangre,
      curp: curp,
      lugarNac: lugarNac,
      tipoZona: tipo_zona,
      lengua_id: lengua_indigena, #modificar al catalogo de lenguas
      direcion: {
        calle: calle,
        numero:numero,
        colonia: colonia,
        estado: @selectEstado.val()
        municipio: @selectMunicipio.val()
        localidad: @selectLocalidad.val()
      },
      calzado: calzado,
      tallaPans: talla_pans,
      tallaPlayera: talla_playera,
      telefono: telefono,
      educacion_id: educacionNivel,
      secundaria:{
        tipo: tipo_secundadia,
        nombre: nombre_secundadia
      },
      educacion: {
        tipo: nivel_educacion,
        nombre: nombre_educacion
      }
    }
    console.log aspirante
