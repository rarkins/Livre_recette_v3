class CreateRecettes < ActiveRecord::Migration[4.2]
  def change
    create_table :recettes do |t|
      t.string :titre, :null=>false
      t.string :source
      t.integer :auteur,  :null=>false
      t.string :preparation,  :null=>false
      t.string :cuisson
      t.string :marinage
      t.string :portion
      t.text :ingredient,  :null=>false
      t.text :instruction,  :null=>false
      t.text :note
      t.string :accompagnement
      t.string :vin

      t.timestamps
    end
  end
end
