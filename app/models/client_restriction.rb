class ClientRestriction < ApplicationRecord
    belongs_to :client 
    belongs_to :restriction
end 