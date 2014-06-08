class GestionFe.Views.RegistroAspirantes extends Backbone.View
  template: JST['gestions/registro_aspirantes']
  templateSelectIdioma: JST['gestions/catalogos/select_idioma']
  templateSelectGeneric: JST['gestions/catalogos/select_generic']
  events:
    'click input.nivelEducacion': 'checkNivelEducacion'
    'change #select-estado' : 'resetMunicipio'
    'change #select-municipio' : 'resetLocalidad'
    'click .btn-save': 'guardarAspirante'
  localidades: null
  municipios: null
  estados: null
  idiomas: null
  tiposEducacion: null
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

  getIdiomas: (idiomas) ->
    @idiomas = idiomas
    @$('#lengua_indigena').empty()
    @idiomas.each(@renderIdioma, this)

  renderIdioma: (idioma) ->
    html = @templateSelectIdioma(idioma: idioma.toJSON())
    $('#lengua_indigena').append(html)

  getTipoEducacion: (tiposEducacion) ->
    @tiposEducacion = tiposEducacion
    @$('#tipo-secundaria').empty()
    @$('#tipo-media').empty()
    @$('#tipo-superior').empty()
    @tiposEducacion.each(@renderTipoEducacion, this)

  renderTipoEducacion: (tipoEducacion) ->
    tipo = tipoEducacion.toJSON()
    tipo['nombre'] = tipo.tipo
    html = @templateSelectGeneric(select: tipo)
    if tipo.educational_level_id == 1
      $('#tipo-secundaria').append(html)
    if tipo.educational_level_id == 2
      $('#tipo-media').append(html)
    if tipo.educational_level_id == 3
      $('#tipo-superior').append(html)

  guardarAspirante: ->
    nombre_aic = this.$('#nombre_aic').val()
    apell_pat_aic = this.$('#apell_pat_aic').val()
    apell_mat_aic = this.$('#apell_mat_aic').val()
    fecha_nac = moment(this.$('#fecha_nac').val(), "DD/MM/YYYY")
    sexo = this.$('#sexo_aic').val()
    tipo_sangre = @$('#tipo_sangre_aic').val()
    curp = @$('#curp_aic').val()
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
    nombre_secundadia = @$('#nombre-secundaria').val()
    tipo_media = @$('#tipo_media').val()
    nombre_media = @$('#nombre_media').val()
    tipo_superior = @$('#tipo-superior').val()
    nombre_superior = @$('#nombre-superior').val()

    aspirante = {
      nombre: nombre_aic,
      a_paterno: apell_pat_aic,
      a_materno: apell_mat_aic,
      fecha_nac: fecha_nac.format('DD/MM/YYYY'),
      sexo: sexo,
      tipo_sangre: tipo_sangre,
      curp: curp,
      rfc: rfc,
      lugar_nac: lugarNac,
      tipo_zona: tipo_zona,
      language_id: lengua_indigena, #modificar al catalogo de lenguas
      direcion: {
        calle: calle,
        numero:numero,
        colonia: colonia,
        estado: @selectEstado.val()
        municipio: @selectMunicipio.val()
        localidad: @selectLocalidad.val()
      },
      calzado: calzado,
      talla_pants: talla_pans,
      talla_playera: talla_playera,
      telefono: telefono,
      secundaria:{
        school_type_id: tipo_secundadia,
        nombre: nombre_secundadia
      },
      media: {
        school_type_id: tipo_media,
        nombre: nombre_media
      },
      superior: {
        school_type_id: tipo_superior,
        nombre: nombre_superior
      }
      cuestionario: {
        salud: $('#p1').val(),
        descripcion_salud: $('#p1-descripcion').val(),
        enfermedad: $('#p2').val(),
        tipo_enfermedad: $('#p2-descripcion').val(),
        colaborador: $('#p3').val(),
        funcion: $('#p3-descripcion').val(),
        familiares: $('#p4').val(),
        termino_estudios: $('#p5').val()
        deuda_materia: $('#p6').val(),
        materia: $('#p6-descripcion2').val(),
        enterado: $('#p7').val(),
        materia: $('#p7-descripcion').val(),
        nivel_servicio: $('#p8').val(),
      }
    }
    @collection.create aspirante,
      wait: true
      success: ->
        console.log "funciona!!!"