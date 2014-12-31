class RecettesController < ApplicationController

  before_filter :do_authentication, only: [:edit, :update, :destroy]
  before_filter :signed_in?, only: [:new]
  def home
    @recettes = Recette.search(params[:search])
    @pos = 0
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recettes }
    end
  end

  # GET /recettes
  # GET /recettes.json
  def index
    @current_page = "recettes"
    @pos = 0
    if params != nil then
      if params[:sort] == "creation" then
        @recettes = Recette.all.order("id desc")
      else
        @recettes = Recette.all.order("titre asc")
      end
    else
      @recettes = Recette.all.order("titre asc")
    end

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
    @recette = Recette.new(recette_params)
    @recette.user_id = current_user[:id]
    if params[:comment] != nil then
      @comment = @recette.comments.new(:content => params[:comment][:content], :user_id => current_user[:id], :recette_id => @recette[:id])
    end
    respond_to do |format|
      if @recette.save
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
    #params[:recette][:category_ids] ||= []

    @recette.update_attributes!(recette_params)
    redirect_to @recette
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

  private

  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def recette_params
    params.require(:recette).permit( {:category_ids => []}, :user_id, :ingredient, :instruction, :portion, :preparation, :titre, :vin, :source, :note, :marinage, :cuisson, :accompagnement, :photo, :photos_attributes => [:signature, :created_at, :tags, :bytes, :type, :url, :secure_url, :etag, :public_id, :version, :width, :height, :format, :resource_type])
  end

end

