class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :stuno,null:false
      t.string :major
      #t.string :grade
      #t.belongs_to :grade
      t.timestamps null: false


      #t.index :grade
      t.index :stuno
    end
  end
end
