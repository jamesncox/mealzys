module RecipesHelper

    #refactor this method to make danger = {} and store each client as a key, and make an array of ingredients as the value.
    #then an if statement if true (matches) the client name and shovel <<

    # danger = {"Tiffany"=> [dairy, gluten, mushrooms]} clients, clients.restrcitions
    def find_restrictions(clients, recipe) # create hash for clients and array of their restrictiopns
       res_hash = {}
         clients.each do |client| 
            client.restrictions.each do |res|
                recipe.ingredients.each do |ing|
                    allergy_to_array(recipe).each do |allergy|
                        if res.name == ing.name || res.name == allergy
                           if !res_hash["#{client.name}"] 
                                res_hash["#{client.name}"] = []
                           end 
                           res_hash["#{client.name}"] << res if !res_hash["#{client.name}"].any?(res)  
                        end   
                    end 
                end
            end 
         end 
        render_restrictions(res_hash)
    end 

    def allergy_to_array(recipe) # build array to check ingredients for addt restrictions
        allergies = recipe.allergy.split(", ")
    end 

    def render_restrictions(res_hash) # display list of restrictions
        str = ''
        res_hash.each do |client, res_obj|
            res_obj.each do |res|
                str << "<ul> 
                <li>#{client}: <em>#{res.name.humanize}</em></li> 
                </ul>"
            end 
        end 
        str.html_safe
    end 

end
