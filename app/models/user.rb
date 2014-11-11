class User < ActiveRecord::Base
	before_save do |user| 
        user.email = email.downcase 
	    user.remember_token = SecureRandom.urlsafe_base64
    end

    validates :studentId, presence: true, 
                        uniqueness: { case_sensitive: false },
                        length: { minimum: 4 }
	validates :name, presence: true,presence: true, length: { in: 9..30 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    has_secure_password      # A magic method!!

end
