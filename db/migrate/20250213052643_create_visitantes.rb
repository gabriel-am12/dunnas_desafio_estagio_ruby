class CreateVisitantes < ActiveRecord::Migration[8.0]
  def change
    create_table :visitantes do |t|
      t.string :cpf, null: false
      t.string :nome, null: false
      t.string :rg
      t.string :telefone
      t.string :foto

      t.timestamps
    end
    add_index :visitantes, :cpf, unique: true
  end
end
