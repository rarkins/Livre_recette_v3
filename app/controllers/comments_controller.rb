class CommentsController < ApplicationController
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
    @recette = Recette.find(params[:recette_id])
    @comment = @recette.comments.new(:content => params[:comment][:content], :user_id => current_user[:id], :recette_id => @recette[:id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to recette_path(@recette), notice: 'Comment was successfully created.' }
        format.json { render json: @recette, status: :created, location: @recette }
      else
        format.html { render 'new', error: @comment.errors }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @recette = @comment.recette_id
  end

  def update
    @current_page = "recettes"
    @comment = Comment.find(params[:id])
    @recette = @comment.recette_id

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @recette = @comment.recette_id
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to recette_comments_path(@recette) }
      format.json { head :no_content }
    end

  end

end
