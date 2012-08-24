class CommentsController < ApplicationController
  def create
    @recette = Recette.find(params[:recette_id])
    @recette.comments.create!(:content => params[:comment][:content], :user_id => current_user[:id], :recette_id => @recette[:id])
    redirect_to recette_path(@recette)
  end
end
