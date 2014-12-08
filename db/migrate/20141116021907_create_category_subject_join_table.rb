class CreateCategorySubjectJoinTable < ActiveRecord::Migration
  def change
  	create_table :categories_subjects, :id => false do |t|
      t.integer :category_id
      t.integer :subject_id
    end
  end
end
