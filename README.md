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