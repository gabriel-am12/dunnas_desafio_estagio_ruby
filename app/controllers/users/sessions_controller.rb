class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if resource.administrador?
      admin_dashboard_path
    elsif resource.atendente?
      atendente_dashboard_path
    elsif resource.funcionario?
      funcionarios_dashboard_path
    else
      root_path
    end
  end

  def destroy
    super
  end
end
