class RecettesController < ApplicationController

  before_filter :do_authentication, only: [:edit, :update, :destroy]
  before_filter :signed_in?, only: [:new]
  # GET /recettes
  # GET /recettes.json
  def index
    @current_page = "recettes"

    @recettes = Recette.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recettes }
    end
  end

  # GET /recettes/1
  # GET /recettes/1.json
  def show
    @current_page = "recettes"

    @recette = Recette.find(params[:id])
    @categories = Category.all

    @comments = Recette.find(params[:id]).comments.limit(3)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recette }
    end
  end

  # GET /recettes/new
  # GET /recettes/new.json
  def new
    @current_page = "recettes"
    @recette = Recette.new
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recette }
    end
  end

  # GET /recettes/1/edit
  def edit
    @current_page = "recettes"
    @recette = Recette.find(params[:id])
  end

  # POST /recettes
  # POST /recettes.json
  def create
    @current_page = "recettes"
    @recette = Recette.new(params[:recette])
    @recette.user_id = current_user[:id]
    respond_to do |format|
      if verify_recaptcha(:model => @recette, :message => 'Il y a une erreur avec le reCAPTCHA!') && @recette.save
        format.html { redirect_to @recette, notice: 'Recette was successfully created.' }
        format.json { render json: @recette, status: :created, location: @recette }
      else
        format.html { render action: "new" }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recettes/1
  # PUT /recettes/1.json
  def update
    @current_page = "recettes"
    @recette = Recette.find(params[:id])
    params[:recette][:category_ids] ||= []

    respond_to do |format|
      if verify_recaptcha(:model => @recette, :message => 'Il y a une erreur avec le reCAPTCHA!') && @recette.update_attributes(params[:recette])
        format.html { redirect_to @recette, notice: 'Recette was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recettes/1
  # DELETE /recettes/1.json
  def destroy
    @current_page = "recettes"
    @recette = Recette.find(params[:id])
    @recette.destroy

    respond_to do |format|
      format.html { redirect_to recettes_url }
      format.json { head :no_content }
    end
  end
end
