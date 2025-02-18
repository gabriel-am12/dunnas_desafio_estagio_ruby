# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_17_051509) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.bigint "setor_id"
    t.bigint "unidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["setor_id"], name: "index_funcionarios_on_setor_id"
    t.index ["unidade_id"], name: "index_funcionarios_on_unidade_id"
    t.index ["user_id"], name: "index_funcionarios_on_user_id"
  end

  create_table "setores", force: :cascade do |t|
    t.string "nome"
    t.bigint "unidade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_id"], name: "index_setores_on_unidade_id"
  end

  create_table "unidades", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.bigint "unidade_id"
    t.bigint "setore_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["setore_id"], name: "index_users_on_setore_id"
    t.index ["unidade_id"], name: "index_users_on_unidade_id"
  end

  create_table "visita", force: :cascade do |t|
    t.bigint "visitante_id", null: false
    t.bigint "setor_id", null: false
    t.bigint "funcionario_id"
    t.datetime "data_hora_entrada", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "data_hora_saida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unidade_id", null: false
    t.index ["funcionario_id"], name: "index_visita_on_funcionario_id"
    t.index ["setor_id"], name: "index_visita_on_setor_id"
    t.index ["unidade_id"], name: "index_visita_on_unidade_id"
    t.index ["visitante_id"], name: "index_visita_on_visitante_id"
  end

  create_table "visitantes", force: :cascade do |t|
    t.string "cpf", null: false
    t.string "nome", null: false
    t.string "rg"
    t.string "telefone"
    t.string "foto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unidade_id"
    t.index ["cpf"], name: "index_visitantes_on_cpf", unique: true
  end

  add_foreign_key "funcionarios", "setores", column: "setor_id"
  add_foreign_key "funcionarios", "unidades"
  add_foreign_key "funcionarios", "users"
  add_foreign_key "setores", "unidades"
  add_foreign_key "users", "setores"
  add_foreign_key "users", "unidades"
  add_foreign_key "visita", "funcionarios"
  add_foreign_key "visita", "setores", column: "setor_id"
  add_foreign_key "visita", "unidades"
  add_foreign_key "visita", "visitantes"
end
