class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :genre_id, null: false
      t.string :user_id, null: false
      t.string :title, null: false
      t.text :explain, null: false
      t.string :image
      t.string :ip

      t.timestamps
    end
  end
end
