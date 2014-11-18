class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	        add_index :users, :email, unique: true
  end
end


class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	  add_index :courses_subjects, :email, unique: true
  end
end
