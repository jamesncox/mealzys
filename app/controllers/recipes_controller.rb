class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find(params[:id])
        binding.pry
    end 

    def index
        @recipes = Recipe.all
    end

    def new 
        @recipe = Recipe.new
        10.times { @recipe.ingredients.build }
        #line 13 is not ideal from what it sounds like even though it appears to work, ask DJ about it.
    end

    def create
    
        @recipe = Recipe.new (recipe_params)
        binding.pry
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
            params.require(:recipe).permit(:name, :serves, :sauce, :garnish, :instructions, :user_id,
                ingredients_attributes: [
                    :name, 
                    :quantity,
                    :size,
                    :unit
                ]
            )
        end
end