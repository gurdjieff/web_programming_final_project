class SubjectsController < ApplicationController
  def show
	 @subjects = Subject.all
  end

def showSubjectHasFeedbacked
  	@subjects = current_user.feedback_subjects
  end
  def showSubjectHasGraded
  	@subjects = current_user.grade_subjects
  end
  def showSubjectInOrder
  	@subjects = Subject.all
    @subjects = @subjects.sort { |a,b| a.feedbacks.size <=> b.feedbacks.size }    
  	# @subjects.sort(@subjects.feedbacks.size)
  end
end
