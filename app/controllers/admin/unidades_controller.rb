class Admin::UnidadesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_unidade, only: [:show, :edit, :update, :destroy]

  def show
    @unidade = Unidade.find(params[:id])
  end

  def index
    @unidades = Unidade.all
  end

  def new
    @unidade = Unidade.new
  end

  def create
    @unidade = Unidade.new(unidade_params)
    if @unidade.save
      redirect_to admin_unidades_path, notice: "Unidade criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @unidade = Unidade.find(params[:id])
  end

  def update
    @unidade = Unidade.find(params[:id])
    if @unidade.update(unidade_params)
      redirect_to admin_unidades_path, notice: "Unidade atualizada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @unidade = Unidade.find(params[:id])
    @unidade.destroy
    redirect_to admin_unidades_path, alert: "Unidade removida!"
  end

  private

  def set_unidade
    @unidade = Unidade.find(params[:id])
  end

  def unidade_params
    params.require(:unidade).permit(:nome, :endereco, :telefone)
  end

  def authorize_admin
    redirect_to root_path, alert: "Acesso não autorizado!" unless current_user.administrador?
  end
end
