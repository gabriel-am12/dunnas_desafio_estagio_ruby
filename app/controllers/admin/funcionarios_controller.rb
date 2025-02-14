class Admin::FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:edit, :update, :destroy]
  before_action :set_setores, only: [:new, :edit, :update]

  def index
    @funcionarios = Funcionario.all
  end

  def new
    @funcionario = Funcionario.new
  end

  def create
  ActiveRecord::Base.transaction do

    email_padrao = "#{params[:funcionario][:nome].downcase.gsub(' ', '_')}@email.com"
    user = User.create!(
      email: email_padrao,
      password: "123456",
      role: :funcionario
    )

    @funcionario = Funcionario.new(funcionario_params.merge(user_id: user.id))

    if @funcionario.save
      redirect_to admin_funcionarios_path, notice: "Funcionário criado com sucesso."
    else
      flash[:alert] = @funcionario.errors.full_messages.join(", ")
      render :new
    end
  end
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = "Erro ao criar funcionário: #{e.message}"
    render :new
  end


  def edit
    @funcionario = Funcionario.find(params[:id])
  end

  def update
    if @funcionario.update(funcionario_params)
      redirect_to admin_funcionarios_path, notice: "Funcionário atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @funcionario = Funcionario.find(params[:id])
    @funcionario.destroy
    @funcionario.user.destroy if @funcionario.user 
    redirect_to admin_funcionarios_path, notice: "Funcionário excluído com sucesso."
  end

  private

  def set_funcionario
    @funcionario = Funcionario.find(params[:id])
  end

  def set_setores
    @setores = Setor.all
  end

  def funcionario_params
    params.require(:funcionario).permit(:nome, :setor_id)
  end
end

