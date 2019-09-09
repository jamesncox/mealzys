module RecipesHelper

    def find_restrictions(clients, recipe)
        danger = []
        client_res = []
         clients.each do |client| 
            client.restrictions.each do |res|
                recipe.ingredients.each do |ing|
                    allergy_to_array(recipe).each do |allergy|
                        if res.name == ing.name || res.name == allergy
                            danger << res 
                            client_res << client
                        end   
                    end 
                end
            end 
         end 
        render_restrictions(danger, client_res)
    end 

    def allergy_to_array(recipe)
        allergies = recipe.allergy.split(", ")
    end 

    def render_restrictions(ingredients, clients)
        return string of client name: ingreient name 
    end 

end
