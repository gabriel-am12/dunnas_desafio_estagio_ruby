class Setor < ApplicationRecord
  belongs_to :unidade
  has_many :funcionarios
  validates :nome, presence: true
end