module RecipesHelper

    #refactor this method to make danger = {} and store each client as a key, and make an array of ingredients as the value.
    #then an if statement if true (matches) the client name and shovel <<

    # def find_restrictions(clients, recipe)
    #     # binding.pry
    #     danger = {}
    #     danger << clients
    #     clients.each do |client|
    #         client.restrictions.each do |res|
    #             res
    #         end 
    #      end
    # end 

    # danger = {"Tiffany"=> [dairy, gluten, mushrooms]}

    
    # def find_restrictions(clients, recipe)
    #     danger = []
    #     client_res = []
    #      clients.each do |client| 
    #         client.restrictions.each do |res|
    #             recipe.ingredients.each do |ing|
    #                 allergy_to_array(recipe).each do |allergy|
    #                     if res.name == ing.name || res.name == allergy
    #                         danger << res 
    #                         client_res << client
    #                     end   
    #                 end 
    #             end
    #         end 
    #      end 
    #     render_restrictions(danger, client_res)
    # end 

    # def allergy_to_array(recipe)
    #     allergies = recipe.allergy.split(", ")
    # end 

    # def render_restrictions(ingredients, clients)
    #     ingredients.each do |ing|
    #         "#{ing.name}"
    #     end 
    # end 

end
