class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.text :content, :null => false
      t.integer :user_id, :null => false
      t.integer :recette_id, :null => false

      t.timestamps
    end
  end
end
