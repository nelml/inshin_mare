class CreateFavarticles < ActiveRecord::Migration[5.2]
  def change
    create_table :favarticles do |t|
      t.string :user_id, null: false
      t.string :article_id, null: false

      t.timestamps
    end
  end
end
