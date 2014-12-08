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
  def showCategoriesSubjectBelongTo
    if params && params[:categories_id] && params[:categories_id][:subject_id]
      sub = Subject.find(params[:categories_id][:subject_id])
      @categories = sub.categories
    else
    end
  end
end
