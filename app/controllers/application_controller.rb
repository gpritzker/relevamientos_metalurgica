class ApplicationController < ActionController::Base

 protected

  def after_sign_out_path_for(resource_or_scope)
    new_usuario_session_path
  end
end
