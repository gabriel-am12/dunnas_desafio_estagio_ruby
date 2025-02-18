class VisitasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visita, only: %i[show edit update destroy]
  before_action :verificar_acesso_atendente, only: [:index, :show, :new, :create]

  def finalizar
    @visita = Visita.find(params[:id])
    if @visita.update(data_hora_saida: Time.now)
      redirect_to dashboard_funcionario_path, notice: "Visita finalizada com sucesso."
    else
      redirect_to dashboard_funcionario_path, alert: "Erro ao finalizar visita."
    end
  end

  def index
    if current_user.atendente?
      @visitas = Visita.where(unidade_id: current_user.unidade_id)
    else
      @visitas = Visita.all
    end
  end

  def show; end

  def new
    @visita = Visita.new
    @visitante = Visitante.find_by(cpf: params[:cpf]) || Visitante.new

    puts "Debug: @visita inicializada? #{@visita.inspect}"
  end


  def create
    puts "===== PARAMS RECEBIDOS ====="
    puts params.inspect
    puts "============================"

    @visitante = Visitante.find_by(cpf: params[:visitante][:cpf])

    if @visitante
      puts "Visitante encontrado: #{@visitante.id}"
    else
      @visitante = Visitante.new(visitante_params)

      if @visitante.save
        puts "Novo visitante criado: #{@visitante.id}"
      else
        puts "Erro ao salvar visitante: #{@visitante.errors.full_messages}"
        render :new and return
      end
    end

    setor = Setor.find_by(id: visita_params[:setor_id])

    if setor.nil?
      puts "Erro: Setor não encontrado!"
      render :new and return
    end

    unidade = setor.unidade

    if unidade.nil?
      puts "Erro: Unidade não encontrada para o setor!"
      render :new and return
    end

    @visita = Visita.new(visita_params)
    @visita.visitante_id = @visitante.id
    @visita.unidade_id = unidade.id
    @visita.data_hora_entrada ||= Time.now
    
    if @visita.save
      puts "Visita criada com sucesso: #{@visita.id}"
      redirect_to visita_path(@visita), notice: 'Visita registrada com sucesso.'
    else
      puts "Erro ao salvar visita: #{@visita.errors.full_messages}"
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

  def verificar_acesso_atendente
    unless current_user.administrador? || current_user.atendente? || current_user.funcionario?
      redirect_to root_path, alert: "Acesso negado."
    end
  end

  def set_visita
    @visita = Visita.find(params[:id])
  end

  def visita_params
    params.require(:visita).permit(:visitante_id, :setor_id, :funcionario_id, :data_hora_entrada, :unidade_id)
  end

  def visitante_params
    params.require(:visitante).permit(:cpf, :nome, :rg, :telefone, :foto, :unidade_id)
  end

end

