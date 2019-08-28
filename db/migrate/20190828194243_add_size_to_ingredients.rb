class AddSizeToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :size, :integer
  end
end
