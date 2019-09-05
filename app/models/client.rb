class Client < ApplicationRecord
    has_many :client_restrictions
    has_many :restrictions, through: :client_restrictions

    accepts_nested_attributes_for :restrictions
end
