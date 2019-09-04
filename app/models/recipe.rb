class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    #write custom nested_attributes
    #add user.id as a hidden field
    #accepts_nested_attributes_for :ingredients,
     #                                   reject_if: lambda{ |ingred| ingred["name"].blank? }

    validates :name, uniqueness: true
    validates :name, presence: true


    def ingredients_attributes=(ingredients_attributes)
        ingredients_attributes.map do |attr|
            attr.each do |ingred|
                binding.pry
                self.ingredients << Ingredient.find_or_create_by(name: ingred["name"]) unless ingred["name"].blank?
            end 
        end 

    end 
end
