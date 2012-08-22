class UsersController < ApplicationController
  
  def new
    redirect_to new_user_registration_path
  end
  
  def show
    @user = User.find(params[:id])
    @recettes = @user.recettes
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    redirect_to root_path
  end
  
end