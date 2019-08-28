class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :serves
      t.string :sauce
      t.string :garnish
      t.text :instructions

      t.timestamps
    end
  end
end
