class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.administrador?
      can :manage, :all
    elsif user.atendente?
      can :create, Visitante
      can :read, Visitante
      can :create, Visita
    elsif user.funcionario?
      can :read, Visita
      can :update, Visita, funcionario_id: user.id
    end
  end
end

