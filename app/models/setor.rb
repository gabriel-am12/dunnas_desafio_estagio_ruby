class Setor < ApplicationRecord
  self.table_name = "setores"

  belongs_to :unidade
  has_many :funcionarios, dependent: :destroy
  validates :nome, presence: true
end