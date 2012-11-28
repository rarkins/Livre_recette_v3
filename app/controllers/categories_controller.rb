class CategoriesController < ApplicationController

  before_filter :do_authentication_admin, :except => [:show, :index]
  # GET /categories
  # GET /categories.json
  def index

    @current_page = "categories"

    @categories = Category.find(:all, :order => "nom")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @current_page = "categories"

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
    @category = Category.new(params[:category])

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

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Categorie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
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
    data = Category.find(une_categorie).recettes.order("titre asc")
    @recettes = []
    data.each do |row|

      @recettes << row[:id]
    end
    @recettes
  end

end
