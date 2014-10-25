class SessionsController < ApplicationController
  def new
  end

  def destroy
	sign_out
	redirect_to root_url
  end 

   def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          sign_in user 
          redirect_to user      #  NEW LINE

          # Sign the user in and redirect to the user's show page.
        else
          flash[:error] = 'Invalid email/password combination'
          render 'new'
        end
     end
end
