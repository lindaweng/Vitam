class CreatePersonalWords < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_words do |t|
      t.integer :user
      t.string :word
      t.string :image
      t.timestamps null: false
    end
  end
end
