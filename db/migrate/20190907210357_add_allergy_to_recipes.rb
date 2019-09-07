class AddAllergyToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :allergy, :string
  end
end
