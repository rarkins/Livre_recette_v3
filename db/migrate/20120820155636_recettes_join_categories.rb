class RecettesJoinCategories < ActiveRecord::Migration
  def change
    create_table :categories_recettes, :id => false do |t|
      t.integer :recette_id
      t.integer :category_id
    end

    add_index :categories_recettes, [:recette_id, :category_id]

  end
end
