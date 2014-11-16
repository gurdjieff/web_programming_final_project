class SubjectsController < ApplicationController
  def show
	 @subjects = Subject.all
	 # @courses = 
  end
end
