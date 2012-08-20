class ApplicationController < ActionController::Base
  protect_from_forgery
  def user_is_admin?
    deny_access unless current_user.admin
  end

  def deny_access
    redirect_to root_path, :flash => { :info => "Seul un administrateur peut acceder a cette page" }
  end

end
