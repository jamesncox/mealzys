class Client < ApplicationRecord
    has_many :client_restrictions
    has_many :restrictions, through: :client_restrictions

    validates :name, presence: true 
    validates :name, uniqueness: true

    # accepts_nested_attributes_for :restrictions

    def restrictions_attributes=(restrictions_attributes)
        restrictions_attributes.map do |attr|
            attr.each do |res|
                self.restrictions << Restriction.find_or_create_by(name: res["name"].downcase) unless res["name"].blank?
            end 
        end 
    end 


end
