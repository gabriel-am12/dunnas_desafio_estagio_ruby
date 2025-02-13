class RenameSetorsToSetores < ActiveRecord::Migration[8.0]
  def change
    rename_table :setors, :setores
  end
end
