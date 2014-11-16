class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.string :ca_percent
      t.string :final_exam_percent
      t.timestamps
    end
  end
end
