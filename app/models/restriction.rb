class Restriction < ApplicationRecord
    has_many :client_restrictions
    has_many :clients, through: :client_restrictions

    validates :name, uniqueness: {message: "Please select an existing restriction from the drop down menu."}

end
