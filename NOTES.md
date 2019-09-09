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

[x] 1. Create the "tags" for recipe_ingredients model (maybe the clients_restrictions model instead?)
    Then we can link these to recipes with dropdown boxes to select generic/common types of allergies.
    Actually, I just created an :allergy attribute of Recipe model, to associate those to client's matching restriction.

2. Stub out / hardcode some features I'd like to see in my views to wrap my brain around what I have still to do...
[x]  a. add category to recipe for breakfast/lunch/dinner
  b. add dynamic list of clients and their restrictions to recipe show page
[x] c. change the recipe show page list of ingredients, etc. into an actual table with rows/columns?
[x]  d. write scope method in Recipe model to sort by breakfast, lunch, dinner in the index view.

3. My sessions controller and/or user controllers are not doing what they're supposed to be doing... when I click login, I'll get directed to my homepage, but if I click new user signup I also get directed to my homepage as if i were already logged in.

4. Create error messages for when logging in/signing up goes wrong.

5. Abstract the meal_type partial into a helper method?

6. Create helper(class?) method to take a client's restriction and look for an ingredient in a recipe, and post that client's name and matching restriction(ingredient) in the recipe show page. 

7. Create similar helper(class? scope?) method to match a recipe's allergy attribute to a client's restriction, and similarly display the client and matching restriciton in the recipe show page.

8. Look up normalize before_action 


#MOVED OUT OF USERS/NEW.HTML.ERB for now.
  <% if @user.errors.any? %>
    <% @user.errors.full_messages.each do |msg| %>
      <h3><%= msg %></h3>
    <% end %>
  <% end %>

  <% if @user.errors.any? %>
    <ul class="Signup_Errors">
    <% for message_error in @user.errors.full_messages %>
      <li>* <%= message_error %></li>
    <% end %>
    </ul>
  <% end %>


  git add . add new files 
  git commit -m "message" commit message/stage changes 
  git push "pushes code to github" 