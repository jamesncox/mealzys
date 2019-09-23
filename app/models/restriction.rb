class Restriction < ApplicationRecord
    has_many :client_restrictions
    has_many :clients, through: :client_restrictions

    validates :name, presence: true

    # validate :unique_restriction

    # private 

    # def unique_restriction
    #     @restriction = Restriction.find_or_create_by(name: name)
    # end 

end
