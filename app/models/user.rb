class User < ApplicationRecord
    has_many :recipes

    validates :name, uniqueness: true 
    validates :name, presence: true 

    validates :password, :presence => true,
                       :confirmation => true,
                       :length => { minimum: 6 },
                       :unless => :already_has_password?

    has_secure_password

    private

    def already_has_password?
      !self.password_digest.blank?
    end
end
