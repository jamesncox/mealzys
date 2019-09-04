class RemoveSizeFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :size
  end
end
