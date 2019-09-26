class RecipesController < ApplicationController
    before_action :require_login
    before_action :uniform_meal_name, only: [:create]

    def show
        @recipe = Recipe.find(params[:id])
        @clients = Client.all
    end 

    def index
        # @recipes = Recipe.search(params[:allergy]).where(user: current_user)
        if params[:allergy]
            @recipes = Recipe.where('allergy LIKE ?', "%#{params[:allergy]}%")
        else
            @recipes = Recipe.where(user: current_user)
        end
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

    # create a search method that queries the database with where for Recipe allergy and display it with corresponding view.
    def search
        binding.pry
        @recipe = Recipe.where
    end

    private
       
        def recipe_params
            params.require(:recipe).permit(:name, :serves, :instructions, :user_id, :meal, :allergy, :search,
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

        def require_login
            return head(:forbidden) unless session.include? :user_id
        end
end