class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.integer :user_id, null: false
      t.string :artist, null: false
      t.string :music, null: false
      t.text :word
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
