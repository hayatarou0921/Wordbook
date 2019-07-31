class RenameNameColumnToWordlists < ActiveRecord::Migration[5.2]
  def change
    rename_column :wordlists, :name, :titile
  end
end
