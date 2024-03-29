class CategoriesController < ApplicationController

  before_action :do_authentication_admin, :except => [:show, :index]
  # GET /categories
  # GET /categories.json
  def index

    @current_page = "categories"
    @pos = 0
    @categories = Category.all.order("nom")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @current_page = "categories"
    @pos = 0
    @category = Category.find(params[:id])

    recettes_pour_category(@category[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @current_page = "categories"

    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @current_page = "categories"
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @current_page = "categories"
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Categorie was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @current_page = "categories"
    @category = Category.find(params[:id])

    @category.update_attributes!(category_params)
    redirect_to category_path(@category)
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @current_page = "categories"
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  ### start of private block
  private

  def recettes_pour_category(une_categorie)
    @recettes = Category.find(une_categorie).recettes.order("titre asc")
  end

  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def category_params
    params.require(:category).permit(:nom)
  end

end
