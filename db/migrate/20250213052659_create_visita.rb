class CreateVisita < ActiveRecord::Migration[8.0]
  def change
    create_table :visita do |t|
      t.references :visitante, null: false, foreign_key: true
      t.references :setor, null: false, foreign_key: true
      t.references :funcionario, foreign_key: true
      t.datetime :data_hora_entrada, null: false
      t.datetime :data_hora_saida, null: true

      t.timestamps
    end
  end
end
