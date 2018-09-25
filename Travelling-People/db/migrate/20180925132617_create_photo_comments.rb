class CreatePhotoComments < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_comments do |t|
      t.references :user, foreign_key: true
      t.references :photo, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
