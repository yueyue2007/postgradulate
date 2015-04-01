class CreateResearches < ActiveRecord::Migration
  def change
    create_table :researches do |t|
      t.string :title
      t.string :magazine
      t.boolean :self_write
      t.string :publish_time
      t.integer :words_count

      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
