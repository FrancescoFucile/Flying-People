class CreatePhotoLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_likes do |t|
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
