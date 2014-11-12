class FeedbacksController < ApplicationController
  def new
  	@feedback = Feedback.new
  end

  def show
	 @feedbacks = Feedback.all
  end

  
  def create
    feecback_params = params.require(:feedback).                                         
                      permit(:subjectName, :strengths, :weaknesses,:recommendations,:rate)
    @feedback = current_user.feedbacks.build(feecback_params) 
    if @feedback.save
            redirect_to action: 'show', notice: 'subject comment was successfully created.'
    else
        render action: "new" 
    end
  end

   def search
    redirect_to action: "show" 
  end

  private
    def correct_user
      @feedback = current_user.feedbacks.find_by_id(params[:id])
      redirect_to root_url if @feedbacks.nil?
    end
end
