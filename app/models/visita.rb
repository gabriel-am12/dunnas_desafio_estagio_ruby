class Visita < ApplicationRecord
  belongs_to :visitante
  belongs_to :setor
  belongs_to :funcionario, optional: true

  validates :data_hora_entrada, presence: true
end
