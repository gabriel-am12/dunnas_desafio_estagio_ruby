class Visitante < ApplicationRecord
  has_many :visitas
  validates :cpf, presence: true, uniqueness: true
  validates :nome, presence: true
end