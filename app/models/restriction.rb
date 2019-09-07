class Restriction < ApplicationRecord
    has_many :client_restrictions
    has_many :clients, through: :client_restrictions

end
