class AddMealToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :meal, :string
  end
end
