class Feedback < ActiveRecord::Base
	belongs_to :user    # Association with User
    # belongs_to :strength
    belongs_to :subject
    default_scope ->{ order('created_at DESC')}
end
