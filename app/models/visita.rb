class Visita < ApplicationRecord
  belongs_to :visitante
  belongs_to :setor, foreign_key: "setor_id"
  belongs_to :unidade
  belongs_to :funcionario, optional: true

  validates :data_hora_entrada, presence: true
  validate :setor_deve_pertencer_a_unidade


  def setor_deve_pertencer_a_unidade
    if setor.present? && setor.unidade_id != unidade_id
      errors.add(:setor, "deve pertencer à mesma unidade da visita")
    end
  end
end
