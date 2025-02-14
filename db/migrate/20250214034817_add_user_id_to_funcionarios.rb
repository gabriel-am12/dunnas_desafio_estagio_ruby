class AddUserIdToFuncionarios < ActiveRecord::Migration[8.0]
  def change
    add_reference :funcionarios, :user, null: false, foreign_key: true
  end
end
