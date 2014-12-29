module ApplicationHelper
  def current_page?(aPage)
    if aPage == @current_page then
      "current"
    end
  end

  def get_username(an_id)
    
    email = User.find(an_id).email
    
    email[0..email.index("@")-1]
    
  end

  def check_if_link(a_source)
    if a_source.index("http://") then
    true
    else
      if a_source.index("https://") then
      true
      else
      false
      end
    end
  end

  def nombre_recette_pour_category(une_categorie)
    Category.find(une_categorie).recettes.count
  end

  def show_recette_info(une_recette)
    Recette.find(une_recette)
  end

  def user_is_author?
    if current_user then

      if params[:id] == nil then
        @recette = Recette.find(params[:recette_id])
      else
        @recette = Recette.find(params[:id])
      end
      @recette[:user_id] == current_user[:id]
    end
  end

  def user_is_author_comments?(an_id)
    if current_user then
      @comment = Comment.find(an_id)
      @comment[:user_id] == current_user[:id]
    end
  end

  def user_is_admin?
    if current_user then
      current_user.admin
    end
  end

  def do_authentication
    if user_is_author? or user_is_admin? then
    true
    end
  end

  def do_authentication_comments(an_id)
    if user_is_author_comments?(an_id) or user_is_admin? then
    true
    end
  end

  def get_user_id_name(an_id)
    User.find(an_id).username
  end

  def generate_title
    if @recette != nil then
      "#{@recette[:titre]} - Nos Recettes"
    else
      "Nos Recettes"
    end
  end
  
  def get_row_color(a_count)
    if a_count % 2 == 1 then
      "#ffffff"
    else
      "#cccccc"
    end
  end
  
end
