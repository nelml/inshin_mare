class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :articles, :user_id, true
  end
end
