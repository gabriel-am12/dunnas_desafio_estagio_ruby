class Funcionario < ApplicationRecord
  belongs_to :setor, optional: true
  belongs_to :unidade, optional: true
  belongs_to :user, optional: true, dependent: :destroy
  has_many :visitas
  validates :nome, presence: true
end