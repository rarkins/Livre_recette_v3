class UsersController < ApplicationController
  
  def new
    redirect_to new_user_registration_path
  end
  
  def show
    @user = User.find(params[:id])
    @pos = 0
    @recettes = @user.recettes.order("titre")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    redirect_to root_path
  end
  
  def create
        if verify_recaptcha
          super
        else
          build_resource(sign_up_params)
          clean_up_passwords(resource)
          flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."      
          flash.delete :recaptcha_error
          render :new
        end
      end
  
end