class StaticPagesController < ApplicationController
  def home
  	  if signed_in?
	      redirect_to current_user   # NEW LINE
  	  end
  end

  def help
  end

  def about
          # flash[:notice] = "Testing the flash"
      end
end
