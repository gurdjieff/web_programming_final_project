class SubjectsController < ApplicationController
  def show
	 @subjects = Subject.all
  end

  def showSubjectInOrder
  	@subjects = Subject.all
    @subjects = @subjects.sort { |a,b| a.feedbacks.size <=> b.feedbacks.size }    
  	# @subjects.sort(@subjects.feedbacks.size)
  end
end
