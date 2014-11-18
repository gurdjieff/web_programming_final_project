class Subject < ActiveRecord::Base
  has_many :feedbacks
  has_many :grades
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :categorys
  # default_scope -> { order('subject.feedbacks.size DESC') }

  default_scope -> { order('created_at DESC') }
end
