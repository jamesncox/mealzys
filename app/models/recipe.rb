class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    #write custom nested_attributes
    #add user.id as a hidden field
    accepts_nested_attributes_for :ingredients

    validates :name, uniqueness: true
    validates :name, presence: true
end
