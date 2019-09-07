class AddAllergyToRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_ingredients, :allergy, :string
  end
end
