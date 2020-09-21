class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :article_id, null: false
      t.string :user_id
      t.string :name
      t.string :image
      t.text :explain, null: false

      t.timestamps
    end
  end
end
