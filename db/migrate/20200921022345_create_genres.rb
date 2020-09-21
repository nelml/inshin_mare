class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :user_id, null: false
      t.string :name, null: false
      t.string :name_kana, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
