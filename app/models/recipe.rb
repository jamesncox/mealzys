class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, uniqueness: true
    validates :name, presence: true

    # validates :allergy, uniqueness: true

    scope :food_by_meal, -> (meal) {where(meal: meal)}

    def ingredients_attributes=(ingredients_attributes)
        ingredients_attributes.map do |attr|
            attr.each do |ingred|
                self.ingredients << Ingredient.find_or_create_by(name: ingred["name"].downcase) unless ingred["name"].blank?
            end 
        end 
    end 

end
