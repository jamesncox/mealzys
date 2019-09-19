==============================================
models 
-users has_many recipes
-clients - has_many_through restictions
-restrictions 
-recipes has_many Ingredients. through recipe_ingredients  
-ingredients -has_many_through => recipes. has_many_through => quantity
 

===============================================================

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

# Using Terminal to commit and push changes ...

  git add . add new files 
  git commit -m "message" commit message/stage changes 
  git push "pushes code to github" 


  on recipe show 
    -get list of clients who have a restriction to a ingrtedient in recipe 
    recipe.ingredients =  name: "peanut butter" unit: "tablespoons">, name: "jelly", quantity: "2 ",  unit: "tablespoons">,, name: "bread", quantity: "2 ", ]>

    client.restrictions = name: "Dairy", , name: "Gluten", name: "Eggplant",, #<Restriction id: 105, name: "Mushrooms",  name: "Fish",

    we have 2 arrays 
    i need to check each element for a string match 

    client.restrictions.each do |res|
      if res.name.in? recipe.ingredients 

      end 

# view/recipe/show

<p><label>Recipe Allergies: </label><%= @recipe.allergy %></p>

<%= find_restrictions(@clients, @recipe) %>

# to kill a server running in the background

gem install shutup

run "shutup"

# moved update form builder out of /recipe/_form.html.erb 

 <% if params[:action] == "edit" %>
    <h1>New </h1>
    <% 20.times do %>
        <%= f.fields_for :ingredients do |ing|  %>
       
            <%= ing.label :name, "Ingredient: " %>
            <%= ing.text_field :name, value: "" %>

            <%= ing.label :quantity, "Quantity: " %>
            <%= ing.text_field :quantity, value: "" %>
       
            <%= ing.label :unit, "Unit: " %>
            <%= ing.text_field :unit, value: "" %>


      <% end %>
    <% end %>
<% end %>

# different f.select options

 <%#= ing.collection_select(:name, Ingredient.all.sort, :name, :name, :include_blank => true) %>

 <%= ing.select :name, options_from_collection_for_select(Ingredient.order("name ASC"), :name, :name), :prompt => 'Select' %> 

 # moved the Google sign-in html link to notes for now...
 <a href="/auth/google_oauth2"><button>Sign In With Google</button></a>


# ##########################################################################################################################


 # STILL TO DO:

[x] 1. Create the "tags" for recipe_ingredients model (maybe the clients_restrictions model instead?)
    Then we can link these to recipes with dropdown boxes to select generic/common types of allergies.
    Actually, I just created an :allergy attribute of Recipe model, to associate those to client's matching restriction.

[x] 2. Stub out / hardcode some features I'd like to see in my views to wrap my brain around what I have still to do...
[x]  a. add category to recipe for breakfast/lunch/dinner
  b. add dynamic list of clients and their restrictions to recipe show page
[x] c. change the recipe show page list of ingredients, etc. into an actual table with rows/columns?
[x]  d. write scope method in Recipe model to sort by breakfast, lunch, dinner in the index view.

[x] 3. My sessions controller and/or user controllers are not doing what they're supposed to be doing... when I click login, I'll get directed to my homepage, but if I click new user signup I also get directed to my homepage as if i were already logged in.
  a. stlye the button whenever...

[x] 4. Create error messages for when logging in/signing up goes wrong.

[x] 5. Abstract the meal_type partial into a helper method? -> Not necessary. Mark complete.

[x] 6. Create helper(class?) method to take a client's restriction and look for an ingredient in a recipe, and post that client's name and matching restriction(ingredient) in the recipe show page. 

[x] 7. Create similar helper(class? scope?) method to match a recipe's allergy attribute to a client's restriction, and similarly display the client and matching restriciton in the recipe show page.

[x] 8. Look up normalize before_action. -> not necessary. Put it in views/recipe/show to normalize meal type name.

[x] 9. Don't forget OmniAuth! Daniel says he prefers google I think.

10. Eventually create a Measurement model with attributes :unit, :quantity 
    a. will create a dropdown for unit, quantity and ingredient objects with blank fields.

11. Add validations for restrictions so a user has to choose an already create restriction instead of creating same one multiple times.