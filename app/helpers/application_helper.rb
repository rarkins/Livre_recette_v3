module ApplicationHelper
  def current_page?(aPage)
    if aPage == @current_page then
      "current"
    end
  end

  def get_username(an_id)
    User.find(an_id).username
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
    sql = "select count(1) from categories_recettes where category_id = #{une_categorie[:id]}"
    data = ActiveRecord::Base.connection.execute(sql)
    data[0][0]
  end

  def show_recette_info(une_recette)
    Recette.find(une_recette)
  end

  def user_is_author?
    if current_user then
      @recette = Recette.find(params[:id])
      @recette[:user_id] == current_user[:id]
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
  
  def get_user_id_name(an_id)
    User.find(an_id).username
  end

end
