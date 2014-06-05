class GestionFe.Models.Aspirante extends Backbone.Model
  urlRoot: '/api/aspirante'
  idAttribute: 'id'
  default: {
    id: null,
    nombre: null,
    a_paterno: null,
    a_materno_: null,
    fecha_nac: null,
    sexo: null,
    tipo_sangre: null,
    curp: null,
    rfc: null,
    lugar_nac: null,
    domicilio:{
      calle: null,
      numero: null,
      colonia: null,
      municipio: null,
      estado: null,
      localidad: null
    }
  }