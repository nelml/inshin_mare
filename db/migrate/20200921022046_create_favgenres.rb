class CreateFavgenres < ActiveRecord::Migration[5.2]
  def change
    create_table :favgenres do |t|
      t.string :user_id, null: false
      t.string :genre_id, null: false

      t.timestamps
    end
  end
end
