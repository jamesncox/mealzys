# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


TEST CHANGE


==============================================
models 
-users has_many recipes
-clients - has_many_through restictions
-restrictions 
-recipes has_many Ingredients. through recipe_ingredients  
-ingredients -has_many_through => recipes. has_many_through => quantity
 

===============================================================
joins 
-recipe_ingredients
-client_restrictions
=============================================================
 ingreient_params #=> quantity => [1,2,3] measu

 - use a serializer, then the form will have a drop down for prev. used quantities, if it doesnt exist will have text box push to array
 - create ingredients in recipe form nested (
     recipe.new(recipe params)

     recipe_params = :title, :client_id, :user_id, :ingredient_attributes => [:quantity, :name, :measurement] 


     use a checkbox for ingreients, and a dropdown for quantity, and measurement, textbox
 )

[                      ][q][m]
[] onions quantity [ ^][^]
[] chicken 
[] salt 



recipe new 
fields_for @recipe.ingredients.build do |f|

    f.checkbox "title", Ingredient.all
    f.select_tag "quantity", options_from_collection_for_select(ingredient, "quantity","quantity")

FLESH OUT THE APP:

1.


DO THIS LAST:
Add a risks or category, tags essentially, dairy, shellfish, gluten, red meat, to the recipe_ingredients model, and make that a nested form, 


Nest inside either the ingredient or recipe form.

FOR EVALUATION:

Look over form_tag syntax for login




CRAPPY NEW RECIPE FORM

 <%= form_for @recipe do |f| %>
 
<div>Instructions:</div> <div><%= f.text_area :instructions %></div>

Add Ingredients:

   <div>
    <%= f.fields_for :recipe_ingredients, @ingredients do |recipe_ingredient| %>
    <div>
      Quantity: <%= recipe_ingredient.text_field :quantity %><br>
      <br>
  
    Select Ingredient:
    <%= recipe_ingredient.collection_select :ingredient_id, Ingredient.order('name ASC').all, :id, :name, include_blank: 'Select Ingredient' %>
    <%= recipe_ingredient.fields_for :ingredient, @recipe.ingredients.build do |ingredient| %>
    Or Create New Ingredient: <%= ingredient.text_field :name %>
    <% end %>
    </div>
      <% end %>
   </div>

  <%= f.submit "Submit" %>

<% end %>


def self.find_by(id)
  self.where(id) 
end 

scope :find_by(id), -> {where(id)}


#recipes scope
def self.has_restriction(name)
  where(restriction: "#{name}")
end # return all recipes with name as a restriction would need to be a form, i'd use form tag  


#STILL TO DO:

1. Create the "tags" for recipe_ingredients model (maybe the clients_restrictions model instead?)
    Then we can link these to recipes with dropdown boxes to select generic/common types of allergies

2. Stub out / hardcode some features I'd like to see in my views to wrap my brain around what I have still to do...
  a. add category to recipe for breakfast/lunch/dinner
  b. add dynamic list of clients and their restrctions to recipe show page
  c. change the recipe show page list of ingredients, etc. into an actual table with rows/columns?