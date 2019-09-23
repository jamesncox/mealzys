class RecipesController < ApplicationController

    before_action :uniform_meal_name, only: [:create]

    def show
        @recipe = Recipe.find(params[:id])
        @clients = Client.all
    end 

    def index
        @recipes = Recipe.where(user: current_user)
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
        @recipe = Recipe.find(params[:id])
        10.times { @recipe.ingredients.build }
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.ingredients.delete_all
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end 

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end

    private
        # nested form lab, adding ingredients attributes to recipe_params
        def recipe_params
            params.require(:recipe).permit(:name, :serves, :instructions, :user_id, :meal, :allergy,
                ingredients_attributes: [
                    :name, 
                    :quantity,
                    :unit,
                    :id]
            )
        end

        def uniform_meal_name 
            params[:recipe][:name] = params[:recipe][:name]
            params[:recipe][:meal] = params[:recipe][:meal].downcase
            params[:recipe][:allergy] =  params[:recipe][:allergy].downcase
        end 
end