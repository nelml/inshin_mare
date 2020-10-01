class CreateContactUs < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_us do |t|
      t.string :title
      t.string :explain
      t.string :user_id

      t.timestamps
    end
  end
end
