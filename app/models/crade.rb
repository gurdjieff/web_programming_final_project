class Crade < ActiveRecord::Base
	belongs_to :user    # Association with User
	belongs_to :subject    # Association with User

end
