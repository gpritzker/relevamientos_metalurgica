class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protected

  def layout_by_resource
    devise_controller? ? "devise" : "application"
  end

  def after_sign_out_path_for(resource_or_scope)
    new_usuario_session_path
  end
end
