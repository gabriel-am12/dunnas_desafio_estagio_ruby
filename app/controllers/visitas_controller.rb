class VisitasController < ApplicationController
  before_action :set_visita, only: %i[show edit update destroy]

  def index
    @visitas = Visita.all
  end

  def show; end

  def new
    @visita = Visita.new
  end

  def create
    @visita = Visita.new(visita_params)
    if @visita.save
      redirect_to @visita, notice: 'Visita registrada com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @visita.update(visita_params)
      redirect_to @visita, notice: 'Registro de visita atualizado.'
    else
      render :edit
    end
  end

  def destroy
    @visita.destroy
    redirect_to visitas_path, notice: 'Registro de visita removido.'
  end

  private

  def set_visita
    @visita = Visita.find(params[:id])
  end

  def visita_params
    params.require(:visita).permit(:visitante_id, :setor_id, :funcionario_id, :data_hora_entrada, :data_hora_saida)
  end
end

