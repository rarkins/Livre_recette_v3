class ApplicationController < ActionController::Base
  protect_from_forgery
  def signed_in?
    deny_access unless current_user
  end

  def user_is_admin?
    if current_user then
      current_user.admin
    end
  end

  def user_is_author?
    if current_user then
      @recette = Recette.find(params[:id])
      @recette[:auteur] == current_user[:id]
    end
  end

  def do_authentication
    if not user_is_author? and not user_is_admin? then
      deny_access
      flash[:SecurityWarning] = "Seul un administrateur ou l'auteur peut acceder a cette page"
    end
  end
  
  def do_authentication_admin
    if not user_is_admin? then
      deny_access
      flash[:SecurityWarning] = 'Seul un administrateur peut acceder a cette page'
    end
  end
  
  def deny_access
    redirect_to root_path, :flash => { :info => "Seul un administrateur peut acceder a cette page" }
  end

end
