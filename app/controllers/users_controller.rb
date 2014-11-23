class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def studentsFeedbackSubject
    if params && params[:subject] && params[:subject][:subject_id]
      subject = Subject.find(params[:subject][:subject_id])
      @users = subject.feedback_users  
    else
    end
  end

  def studentsHadBeenGraded
    if params && params[:subject] && params[:subject][:subject_id]
      subject = Subject.find(params[:subject][:subject_id])
      @users = subject.grade_users  
    else
    end
  end

  def create
    secure_params = params.require(:user).permit(:name, :email, 
                              :studentId, :course_Id, :password, :password_confirmation)
    @user = User.new(secure_params)
    if @user.save
      sign_in @user 
      flash[:success] = "Welcome to the Twitter App!"    # NEW LINE
      redirect_to @user   # NEW LINE
   # Handle a successful save.
    else
        render 'new'     # NEW LINE      
    end
  end
end
