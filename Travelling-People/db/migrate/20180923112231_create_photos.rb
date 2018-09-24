class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.text :description
      t.string :locality
      t.references :user, foreign_key: false

      t.timestamps
    end
  end
end
