class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    #write custom nested_attributes
    #add user.id as a hidden field
    accepts_nested_attributes_for :ingredients,
                                       reject_if: lambda{ |ingred| ingred["name"].blank? }

    validates :name, uniqueness: true
    validates :name, presence: true

    # scope :breakfast, where(:meals => 'breakfast')

    # def breakfast
    #     @recipes = Recipe.breakfast
    # end

    # def ingredients_attributes=(ingredients_attributes)
    #     ingredients_attributes.map do |attr|
    #         attr.each do |ingred|
    #             self.ingredients << Ingredient.find_or_create_by(name: ingred["name"]) unless ingred["name"].blank?
    #         end 
    #     end 

    # end 

    # def ordered_meals
    #     ordered_meal = []
    # end 

    # def self.order_index_by_meal_type
    #     if @recipe.meal == "breakfast"
    #         ordered_meals << @recipe.meal
    #     elsif @recipe.meal == "lunch"
    #         ordered_meals << @recipe.meal
    #     else
    #         ordered_meals << @recipe.meal 
    #     end 
    # end 
end
