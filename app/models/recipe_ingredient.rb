class RecipeIngredient < ApplicationRecord
    belongs_to :recipe 
    belongs_to :ingredient

    # validates :name, uniqueness: true
    # validates :name, presence: true

end 