class FeedbacksController < ApplicationController
  def new
  	@feedback = Feedback.new
  end

  def show
	 @feedbacks = Feedback.all
  end

  
  def create
    feecback_params = params.require(:feedback).                                         
                      permit(:subject_id, :strengths, :weaknesses,:recommendations,:rate)
    @feedback = current_user.feedbacks.build(feecback_params) 
    if @feedback.save
            redirect_to action: 'show', notice: 'subject comment was successfully created.'
    else
        render action: "new" 
    end
  end

   def search
    # SQLite3::SQLException: no such column: feedbacks.subject_id: SELECT "feedbacks".* FROM "feedbacks"  WHERE "feedbacks"."subject_id" = ?
# SQLite3::SQLException: no such column: feedbacks.subject_id: SELECT "feedbacks".* FROM "feedbacks"  WHERE "feedbacks"."subject_id" = ?

    if params && params[:subject_id] && params[:subject_id][:subject_id]
      @subject = Subject.find_by_name(params[:subject_id][:subject_id])
      @feedbacks = @subject.feedbacks  
    end
  end

  private
    def correct_user
      @feedback = current_user.feedbacks.find_by_id(params[:id])
      redirect_to root_url if @feedbacks.nil?
    end
end
