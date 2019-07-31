class RenameNameColumnToWordlists2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :wordlists, :titile, :title
  end
end
