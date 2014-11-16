class CreateCrades < ActiveRecord::Migration
  def change
    create_table :crades do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :over_mark

      t.timestamps
    end
  end
end
