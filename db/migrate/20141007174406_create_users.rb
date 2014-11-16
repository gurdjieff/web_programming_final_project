class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
	  t.string :studentId
  	  t.integer :course_Id
      t.timestamps
    end
  end
end
