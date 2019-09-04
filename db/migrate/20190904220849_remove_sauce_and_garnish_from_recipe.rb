class RemoveSauceAndGarnishFromRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :sauce 
    remove_column :recipes, :garnish
  end
end
