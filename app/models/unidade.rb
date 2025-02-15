class Unidade < ApplicationRecord
  has_many :setores, class_name: "Setor", foreign_key: "unidade_id", dependent: :destroy
  has_many :funcionarios
  has_many :visitantes
  validates :nome, :endereco, :telefone, presence: true
end