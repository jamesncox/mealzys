class RecipeIngredient < ApplicationRecord
    belongs_to :recipe 
    belongs_to :ingredient

    # validates :name, presence: true, uniqueness: {scope: :recipe}
end 