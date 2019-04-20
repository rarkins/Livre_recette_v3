class RenameAuteurToUserIdOnRecettes < ActiveRecord::Migration[4.2]
  def up
    rename_column :recettes, :auteur, :user_id
  end

  def down
    rename_column :recettes, :user_id, :auteur
  end
end
