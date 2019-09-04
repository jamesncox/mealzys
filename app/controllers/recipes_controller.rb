class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find(params[:id])
    end 

    def index
        @recipes = Recipe.all
    end

    def new 
        @recipe = Recipe.new
        @recipe.ingredients.build
        #line 13 is not ideal from what it sounds like even though it appears to work, ask DJ about it.
    end

    def create
        @recipe = Recipe.create(recipe_params)
        redirect_to recipe_path
    end

    def edit 

    end

    def delete

    end

    private
        # nested form lab, adding ingredients attributes to recipe_params
        def recipe_params
            params.require(:recipe).permit(:name, :serves, :sauce, :garnish, :instructions,
                ingredients_attributes: [
                    :name, 
                    :quantity,
                    :size,
                    :unit
                ]
            )
        end
end