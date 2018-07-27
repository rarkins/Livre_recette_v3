# helper module is accessible from the globally throughout the application
# consider teh scope of the helper before adding it at this level
module ApplicationHelper
  def current_page?(a_page)
    'current' if a_page == @current_page
  end

  def get_username(an_id)
    email = User.find(an_id).email
    email[0..email.index('@') - 1]
  end

  def check_if_link(a_source)
    if a_source.index('http://') || a_source.index('https://')
      true
    else
      false
    end
  end

  def nombre_recette_pour_category(une_categorie)
    Category.find(une_categorie).recettes.count
  end

  def show_recette_info(une_recette)
    Recette.find(une_recette)
  end

  def user_is_author?
    return unless current_user

    @recette = if params[:id].nil?
                 Recette.find(params[:recette_id])
               else
                 Recette.find(params[:id])
               end
    @recette[:user_id] == current_user[:id]
  end

  def user_is_author_comments?(an_id)
    return unless current_user
    @comment = Comment.find(an_id)
    @comment[:user_id] == current_user[:id]
  end

  def user_is_admin?
    current_user.admin if current_user
  end

  def do_authentication
    true if user_is_author? || user_is_admin?
  end

  def do_authentication_comments(an_id)
    true if user_is_author_comments?(an_id) || user_is_admin?
  end

  def get_user_id_name(an_id)
    User.find(an_id).email
  end

  def generate_title
    if !@recette.nil?
      "#{@recette[:titre]} - Nos Recettes"
    else
      'Nos Recettes'
    end
  end

  def get_row_color(a_count)
    if a_count.odd?
      #'#ffffff'
      'odd'
    else
      #'#8E918F'
      'even'
    end
  end
end
