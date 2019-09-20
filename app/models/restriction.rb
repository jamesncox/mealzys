class Restriction < ApplicationRecord
    has_many :client_restrictions
    has_many :clients, through: :client_restrictions

    validates :name, uniqueness: {message: "Please select an existing restriction from the drop down menu."}

    #create custom method to find_or_create_by etc...

    def unique_restriction
        @restriction = Restriction.find_or_create_by(name: "?")
    end 
end
