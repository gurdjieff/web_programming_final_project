class User < ActiveRecord::Base
    has_many :feedbacks     # NEW LINE - Indicates association with Micropost
    # has_many :microposts, dependent: :destroy   #  CHANGED
	has_many :crades
    belongs_to :course


    has_many :grade_subjects, :class_name => "Subject" ,
               :through => :crades, :source => :subject
    has_many :feedback_subjects, :class_name => "Subject" ,
               :through => :feedbacks, :source => :subject



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
