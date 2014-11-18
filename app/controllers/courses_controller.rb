class CoursesController < ApplicationController
   before_filter :signed_in_user, only: [:create, :destroy]
   # before_filter :correct_user,   only: :destroy    # NEW LINE

  def modify
  end

 def show
	 @courses = Course.all
  end

  def deleteSubject
    if params[:subject] && params[:course]
      course = Course.find(params[:course])
      course.subjects.delete(params[:subject])
      end
    @courses = Course.all
    render action: "show"     
  end

  def addSubject
    if params[:addSubject] && params[:addSubject][:subject_id]
      subject = Subject.find(params[:addSubject][:subject_id])
      Course.find(params[:course]).subjects << subject
    end
    @courses = Course.all
    render action: "show"     
  end

  # def destroy
  # 		 course.destroy

  #   @courses = Course.all

  #    # redirect_to root_url
  #    render action: "show" 
  # end 


# def create
#         secure_post = params.require(:micropost).permit(:content)
#         @micropost = current_user.microposts.build(secure_post) 
#         if @micropost.save
#           flash[:success] = "Micropost created!"
#           redirect_to root_url
#         else
#           @feed_items = []     # NEW LINE
#           render 'static_pages/home'        end
#       end

#       # UPDATED IMPLEMENTATION
#       def destroy
#         @micropost.destroy
#         redirect_to root_url
#       end

#       # NEW PRIVATE METHOD
#       private

#         def correct_user
#           @micropost = current_user.microposts.find_by_id(params[:id])
#           redirect_to root_url if @micropost.nil?
#         end
#     end

end
