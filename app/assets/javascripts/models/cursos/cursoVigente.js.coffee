class GestionFe.Models.CursoVigente extends Backbone.Model
  idAttribute: 'id'
  default: {
    id: null
    course_id: null,
    municipality_id: null,
    education_type_id: null,
    language_id: null,
    course_status_id: null,
    no_asistencias: null,
    fecha_inicio: null,
    fecha_fin: null
  }