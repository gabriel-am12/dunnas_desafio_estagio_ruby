class ChangeUnidadeIdNullableInFuncionarios < ActiveRecord::Migration[8.0]
  def change
    change_column_null :funcionarios, :unidade_id, true
  end
end
