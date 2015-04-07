class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores  do |t|
      t.references :user,null:false
      t.references :course,null:false
      t.string :course_score

      t.timestamps null: false
    end
  end
end
