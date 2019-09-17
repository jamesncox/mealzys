class User < ApplicationRecord
    has_many :recipes

    validates :name, uniqueness: true 
    validates :name, presence: true 

    validates :password, :presence => true,
                        :confirmation => true,
                        :length => { minimum: 6 }

	has_secure_password

	#comment out Google sign-in code for now
	# def self.from_omniauth(auth)
	# 	# Creates a new user only if it doesn't exist
	# 	where(email: auth.info.email).first_or_initialize do |user|
	# 	  user.name = auth.info.name
	# 	  user.email = auth.info.email
	# 	end
	# end

    # def self.find_or_create_from_auth_hash(auth)
	# 	where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	# 		user.provider = auth.provider
	# 		user.uid = auth.uid
	# 		user.first_name = auth.info.first_name
	# 		user.last_name = auth.info.last_name
	# 		user.email = auth.info.email
	# 		user.picture = auth.info.image
	# 		user.save!
	# 	end
	# end

end
