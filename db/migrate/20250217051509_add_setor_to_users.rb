class AddSetorToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :setore, foreign_key: true, null: true
  end
end
