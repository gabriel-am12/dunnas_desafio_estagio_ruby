class AddUnidadeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :unidade, null: true, foreign_key: true
  end
end
