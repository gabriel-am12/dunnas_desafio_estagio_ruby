class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { administrador: 0, atendente: 1, funcionario: 2 }

  def admin?
    role == "admin"
  end

  def atendente?
    role == "atendente"
  end

  has_one :funcionario
  belongs_to :unidade, optional: true
  validates :unidade_id, presence: true, if: -> { role == "atendente" }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "deve ter um formato válido (exemplo: usuario@email.com)" }
  validates :password, length: { minimum: 6, message: "deve ter no mínimo 6 caracteres" }

  validates :unidade_id, presence: true, if: -> { role == 'atendente' && unidade_id.present? }
  validate :unidade_required_for_atendente

  before_update :remove_funcionario_if_role_changed
  after_create :create_funcionario_if_needed
  
  private

  def unidade_required_for_atendente
    if atendente? && unidade_id.nil?
      errors.add(:unidade_id, "deve ser selecionada para atendentes.")
    end
  end

  def remove_funcionario_if_role_changed
    if role_changed? && role != "funcionario"
      funcionario.destroy if funcionario.present?
    end
  end

  def create_funcionario_if_needed
    Funcionario.create(user: self, nome: self.email.split('@').first) if self.role == "funcionario"
  end

end
