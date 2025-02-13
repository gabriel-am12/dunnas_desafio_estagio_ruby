class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def dashboard
    @usuarios = User.all
    @unidades = Unidade.all
    @setores = Setor.all
    @funcionarios = Funcionario.all
  end

  private

  def authorize_admin
    redirect_to root_path, alert: "Acesso não autorizado!" unless current_user.administrador?
  end
end
