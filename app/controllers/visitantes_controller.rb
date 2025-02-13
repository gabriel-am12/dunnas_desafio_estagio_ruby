class VisitantesController < ApplicationController
  before_action :set_visitante, only: %i[show edit update destroy]

  def index
    @visitantes = Visitante.all
  end

  def show; end

  def new
    @visitante = Visitante.new
  end

  def create
    @visitante = Visitante.new(visitante_params)
    if @visitante.save
      redirect_to @visitante, notice: 'Visitante cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @visitante.update(visitante_params)
      redirect_to @visitante, notice: 'Cadastro atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @visitante.destroy
    redirect_to visitantes_path, notice: 'Cadastro removido com sucesso.'
  end

  private

  def set_visitante
    @visitante = Visitante.find(params[:id])
  end

  def visitante_params
    params.require(:visitante).permit(:cpf, :nome, :rg, :telefone, :foto)
  end
end

