class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @usuarios = User.all
  end

  def new
    @usuario = User.new
  end

  def create
    @usuario = User.new(user_params)
    if @usuario.save
      redirect_to admin_users_path, notice: "Usuário criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @usuario = User.find(params[:id])
  end

  def update
    @usuario = User.find(params[:id])

    if @usuario.update(user_params)
      redirect_to admin_users_path, notice: "Usuário atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end

    if @user.update(user_params)
      if @user.atendente?
        if params[:user][:unidade_id].present?
          @user.update(unidade_id: params[:user][:unidade_id])
        else
          @user.update(unidade_id: nil) # Garante que Atendentes tenham unidade
        end
      else
          @user.update(unidade_id: nil) # Remove a unidade se não for Atendente
      end
      redirect_to admin_users_path, notice: "Usuário atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @usuario = User.find(params[:id])
    @usuario.destroy
    redirect_to admin_users_path, alert: "Usuário removido!"
  end

  private

  def authorize_admin
    redirect_to root_path, alert: "Acesso não autorizado!" unless current_user.administrador?
  end

  def user_params
    params.require(:user).permit(:nome, :email, :password, :password_confirmation, :role, :unidade_id)
  end
end
