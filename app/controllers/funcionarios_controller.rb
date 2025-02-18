class FuncionariosController < ApplicationController
  before_action :authenticate_user!
  before_action :verificar_permissao

  def dashboard
    @visitas = Visita.joins(:setor)
      .where(data_hora_saida: nil, setores: { id: current_user.funcionario.setor_id })
  end

  private

  def verificar_permissao
    redirect_to root_path, alert: "Acesso não autorizado." unless current_user.funcionario?
  end
end

