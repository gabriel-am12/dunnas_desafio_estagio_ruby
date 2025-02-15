class VisitantesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visitante, only: %i[show edit update destroy]
  before_action :verificar_acesso_atendente, only: [:index, :show]
  before_action :verificar_permissao, only: [:edit, :update, :destroy]

  def index
    @visitantes = Visitante.all
  end

  def show; end

  def new
    @visitante = Visitante.new
  end

  def create
    @visitante = Visitante.new(visitante_params)

    @visitante.unidade_id = current_user.unidade_id 

    if @visitante.save
      redirect_to @visitante, notice: 'Visitante cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit; 
  end

  def update
    @visitante = Visitante.find(params[:id])
    if current_user.administrador? || current_user.atendente?
      if @visitante.update(visitante_params)
        redirect_to visitantes_path, notice: 'Cadastro atualizado com sucesso.'
      else
        render :edit
      end
    else
      redirect_to root_path, alert: "Acesso negado."
    end
  end

  def destroy
    @visitante = Visitante.find(params[:id])
    if current_user.administrador? || current_user.atendente?
      @visitante.destroy
      redirect_to visitantes_path, notice: 'Cadastro removido com sucesso.'
    else
      redirect_to visitantes_path, alert: 'Você não tem permissão para excluir este visitante.'
    end
  end

  private

  def verificar_acesso_atendente
    unless current_user.administrador? || (current_user.atendente? && current_user.unidade_id.present?)
      redirect_to root_path, alert: "Acesso negado."
    end
  end

  def verificar_permissao
    visitante = Visitante.find(params[:id])

    unless current_user.administrador? || (current_user.atendente? && @visitante.unidade_id == current_user.unidade_id)
      redirect_to visitantes_path, alert: "Você não tem permissão para modificar este visitante."
    end
  end

  def set_visitante
    @visitante = Visitante.find(params[:id])
  end

  def visitante_params
    params.require(:visitante).permit(:cpf, :nome, :rg, :telefone, :foto, :unidade_id)
  end
end

