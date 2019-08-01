class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word, null: false
      t.string :parts_of_speech
      t.string :meaning
      t.string :example
      t.references :wordlist, foreign_key: true

      t.timestamps
    end
  end
end
