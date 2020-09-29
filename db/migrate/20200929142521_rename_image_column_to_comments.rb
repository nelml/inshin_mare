class RenameImageColumnToComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :comments, :image, :image_id
  end
end
