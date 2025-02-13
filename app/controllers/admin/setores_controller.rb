module Admin
  class SetoresController < ApplicationController
    before_action :set_setor, only: [:edit, :update, :destroy]

    def index
      @setores = Setor.includes(:unidade, :funcionarios).all
    end

    def new
      @setor = Setor.new
    end

    def create
      @setor = Setor.new(setor_params)
      if @setor.save
        redirect_to admin_setores_path, notice: 'Setor criado com sucesso.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @setor.update(setor_params)
        redirect_to admin_setores_path, notice: 'Setor atualizado com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @setor.destroy
      redirect_to admin_setores_path, notice: 'Setor excluído com sucesso.'
    end

    private

    def set_setor
      @setor = Setor.find(params[:id])
    end

    def setor_params
      params.require(:setor).permit(:nome, :unidade_id)
    end
  end
end
