class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.string :subjectName
      t.integer :strengths
      t.string :weaknesses
      t.string :recommendations
      t.integer :rate

      t.timestamps
    end
  end
end
