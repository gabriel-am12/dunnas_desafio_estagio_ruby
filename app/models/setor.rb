class Setor < ApplicationRecord
  self.table_name = "setores"

  belongs_to :unidade
  has_many :users
  has_many :funcionarios, dependent: :destroy
  has_many :visitas
  validates :nome, presence: true
end