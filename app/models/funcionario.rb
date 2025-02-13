class Funcionario < ApplicationRecord
  belongs_to :setor
  belongs_to :unidade
  has_many :visitas
  validates :nome, presence: true
end