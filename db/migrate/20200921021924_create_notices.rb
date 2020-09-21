class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
