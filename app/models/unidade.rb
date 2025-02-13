class Unidade < ApplicationRecord
  has_many :setores
  has_many :funcionarios
  validates :nome, :endereco, :telefone, presence: true
end