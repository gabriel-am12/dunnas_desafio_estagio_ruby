class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { administrador: 0, atendente: 1, funcionario: 2 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "deve ter um formato válido (exemplo: usuario@email.com)" }
  validates :password, length: { minimum: 6, message: "deve ter no mínimo 6 caracteres" }
end
