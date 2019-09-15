class Restriction < ApplicationRecord
    has_many :client_restrictions
    has_many :clients, through: :client_restrictions

    validates :name, presence: true 
    # syntax here is wrong, figure it out!
    # validates :name, uniqueness: true, :message => "You need to select an already created restriction type."
end
