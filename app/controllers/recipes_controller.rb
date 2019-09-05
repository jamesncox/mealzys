class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find(params[:id])
    end 

    def index
        @recipes = Recipe.all
    end

    def new 
        @recipe = Recipe.new
        20.times { @recipe.ingredients.build }
    end

    def create
        @recipe = Recipe.new (recipe_params)
        # binding.pry
        if @recipe.save 
            redirect_to @recipe
        else
            render :new
        end
    end

    def edit 
        #ask DJ if .find or .find_by is, in his opinion, better, and help explain the difference again.
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end 

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
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