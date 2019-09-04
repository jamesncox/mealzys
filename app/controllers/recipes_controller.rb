class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find(params[:id])
    end 

    def index
        @recipes = Recipe.all
    end

    def new 
        @recipe = Recipe.new
        10.times { @recipe.ingredients.build }
    end

    def create
        @recipe = Recipe.new (recipe_params)

        if @recipe.save 
            redirect_to @recipe
        else
            render :new
        end
    end

    def edit 

    end

    def delete

    end

    private
        # nested form lab, adding ingredients attributes to recipe_params
        def recipe_params
            params.require(:recipe).permit(:name, :serves, :instructions, :user_id,
                ingredients_attributes: [
                    :name, 
                    :quantity,
                    :unit
                ]
            )
        end
end