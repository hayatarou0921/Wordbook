class AddReferencesToWordlists < ActiveRecord::Migration[5.2]
  def change
    add_reference :wordlists, :user, foreign_key: true 
  end
end
