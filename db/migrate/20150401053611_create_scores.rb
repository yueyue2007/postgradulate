class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores  do |t|
      t.references :user,null:false
      t.references :course,null:false
      t.string :course_score

      t.timestamps null: false

      t.index([:user_id,:course_id],unique:true)  #add on 5.5 2015
    end
  end
end
