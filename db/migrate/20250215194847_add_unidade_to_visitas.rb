class AddUnidadeToVisitas < ActiveRecord::Migration[8.0]
  def change
    add_reference :visita, :unidade, null: false, foreign_key: true
    change_column_default :visita, :data_hora_entrada, -> { 'CURRENT_TIMESTAMP' }
  end
end
