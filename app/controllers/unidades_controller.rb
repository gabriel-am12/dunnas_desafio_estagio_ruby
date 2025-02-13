class UnidadesController < ApplicationController
  before_action :set_unidade, only: %i[show edit update destroy]

  def index
    @unidades = Unidade.all
  end

  def show; end

  def new
    @unidade = Unidade.new
  end

  def create
    @unidade = Unidade.new(unidade_params)
    if @unidade.save
      redirect_to @unidade, notice: 'Unidade criada com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @unidade.update(unidade_params)
      redirect_to @unidade, notice: 'Unidade atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @unidade.destroy
    redirect_to unidades_path, notice: 'Unidade removida com sucesso.'
  end

  private

  def set_unidade
    @unidade = Unidade.find(params[:id])
  end

  def unidade_params
    params.require(:unidade).permit(:nome, :endereco, :telefone)
  end
end

