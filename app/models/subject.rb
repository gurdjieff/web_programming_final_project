class Subject < ActiveRecord::Base
  has_many :feedbacks
  has_many :grades
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :categorys
  # default_scope -> { order('subject.feedbacks.size DESC') }
 has_many :grade_users, :class_name => "User" ,
               :through => :grades, :source => :user
    has_many :feedback_subjects, :class_name => "User" ,
               :through => :feedbacks, :source => :user
  default_scope -> { order('created_at DESC') }
end
