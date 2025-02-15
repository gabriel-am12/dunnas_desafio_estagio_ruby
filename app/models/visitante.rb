class Visitante < ApplicationRecord
  mount_uploader :foto, FotoUploader

  belongs_to :unidade
  has_many :visitas
  validates :cpf, presence: true, uniqueness: true
  validates :nome, presence: true
end