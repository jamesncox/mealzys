class RecipesController < ApplicationController

    def show
        @recipe = Recipe.find(params[:id])
    end 

    def index
        @recipes = Recipe.all
    end

    def new 
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)
        redirect_to recipe 
    end

    def edit 

    end

    def delete

    end

    private
        def recipe_params
            params.require(:recipe).permit(:name, :serves, :sauce, :garnish, :instructions)
        end
end
