class CommentsController < ApplicationController

  before_filter :do_authentication_comments, only: [:edit, :update, :destroy]
  before_filter :signed_in?, only: [:new]
  def new
    @recette = Recette.find(params[:recette_id])
    @comment = @recette.comments.new(:user_id => current_user[:id], :recette_id => @recette[:id])
  end

  def show
    if params[:recette_id] != nil then
      @recette = Recette.find(params[:recette_id])
      @comments = @recette.comments
      render 'index'
    else
      @comment = Comment.find(params[:id])
    end
  end

  def create
    if params[:comment][:recette_id] == nil then
      @recette = Recette.find(params[:recette_id])
    else
      @recette = Recette.find(params[:comment][:recette_id])
    end

    @comment = @recette.comments.new(:content => params[:comment][:content], :user_id => current_user[:id], :recette_id => @recette[:id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to recette_path(@recette), notice: 'Comment was successfully created.' }
        format.json { render json: @recette, status: :created, location: @recette }
      else
        format.html { redirect_to recette_path(@recette), error: @comment.errors }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @recette = Recette.find(@comment.recette_id)
  end

  def update
    @current_page = "recettes"
    @comment = Comment.find(params[:id])
    @recette = @comment.recette_id
    @comment[:content] = params[:comment][:content]

    @comment.update_attributes!(comments_params)
    redirect_to @comment, notice: 'Comment was successfully updated.'

  end

  def destroy
    @comment = Comment.find(params[:id])
    @recette = @comment.recette_id
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to recette_comments_path(@recette), notice: 'Comment was successfully deleted.'  }
      format.json { head :no_content }
    end

  end

  private

  def do_authentication_comments
    if user_is_author_comments?(params[:id]) or user_is_admin? then
    true
    end
  end

  def user_is_author_comments?(an_id)
    if current_user then
      @comment = Comment.find(an_id)
      @comment[:user_id] == current_user[:id]
    end
  end

  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def comments_params
    params.require(:comment).permit(:content)
  end

end
