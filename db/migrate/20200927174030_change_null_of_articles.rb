class ChangeNullOfArticles < ActiveRecord::Migration[5.2]
  def change
	  def up
	  	change_column :user_id
	  end

	  def down
	  	change_column :user_id, null: false
	  end
  end
end
