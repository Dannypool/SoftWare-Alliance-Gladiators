# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140607212701) do

  create_table "activities", :force => true do |t|
    t.integer  "venue_id"
    t.integer  "venue_locality_id"
    t.integer  "education_type_id"
    t.integer  "language_id"
    t.integer  "necesidad"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "addresses", :force => true do |t|
    t.string   "calle"
    t.integer  "numero"
    t.string   "colonia"
    t.date     "fecha_de_actualizacion"
    t.integer  "locality_id"
    t.integer  "person_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "allocated_figures", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "person_id"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "attendances", :force => true do |t|
    t.integer  "allocated_figure_id"
    t.integer  "evaluacion"
    t.string   "observacion"
    t.integer  "moment_momento"
    t.integer  "moment_year"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "course_statuses", :force => true do |t|
    t.string   "estado"
    t.string   "descripcion"
    t.string   "habilitado"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "description"
    t.string   "nombre"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "nombre"
    t.date     "fecha_creacion"
    t.integer  "repository_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "education_types", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "educational_levels", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "educations", :force => true do |t|
    t.integer  "person_id"
    t.integer  "school_type_id"
    t.string   "nombre"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "localities", :force => true do |t|
    t.string   "localidad"
    t.integer  "municipality_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "modalities", :force => true do |t|
    t.string   "modalidad"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "moments", :force => true do |t|
    t.integer  "momento"
    t.integer  "year"
    t.date     "fecha"
    t.integer  "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "municipalities", :force => true do |t|
    t.string   "municipio"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.integer  "language_id"
    t.integer  "nombre"
    t.string   "a_paterno"
    t.string   "a_materno"
    t.date     "fecha_nac"
    t.integer  "sexo"
    t.integer  "tipo_sangre"
    t.string   "curp"
    t.string   "rfc"
    t.string   "lugar_nac"
    t.integer  "tipo_zona"
    t.integer  "calzado"
    t.integer  "talla_playera"
    t.integer  "talla_pants"
    t.string   "telefono"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "repositories", :force => true do |t|
    t.string   "ruta"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "role_statuses", :force => true do |t|
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "status_id"
    t.integer  "role_id"
    t.integer  "person_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "school_types", :force => true do |t|
    t.integer  "educational_level_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "estado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surveys", :force => true do |t|
    t.integer  "person_id"
    t.integer  "salud"
    t.string   "descripcion_salud"
    t.integer  "enfermedad"
    t.integer  "colaborador"
    t.string   "funcion"
    t.integer  "familiares"
    t.date     "termino_estudios"
    t.integer  "deuda_materia"
    t.string   "materia"
    t.string   "enterado"
    t.integer  "especificacion_enterado"
    t.integer  "nivel_servicio"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "training_figures", :force => true do |t|
    t.integer  "allocated_figure_id"
    t.string   "calificacion"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "training_courses_id"
  end

  create_table "trainning_courses", :force => true do |t|
    t.integer  "municipality_id"
    t.integer  "course_id"
    t.integer  "education_type_id"
    t.integer  "language_id"
    t.integer  "course_status_id"
    t.integer  "no_asistencias"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
  end

  create_table "venues", :force => true do |t|
    t.integer  "locality_id"
    t.string   "localizacion"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
