class CreateCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :categories do |t|
      t.string :nom, :null => false

      t.timestamps
    end
  end
end
