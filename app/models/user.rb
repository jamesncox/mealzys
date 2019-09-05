class User < ApplicationRecord
    has_many :recipes

    validates :name, uniqueness: true 
    validates :name, presence: true 

    validates :password, :presence => true,
                       :confirmation => true,
                       :length => { minimum: 6 }

    has_secure_password

    private
    

end
