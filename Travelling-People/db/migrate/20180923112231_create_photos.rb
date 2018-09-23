class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.text :description
      t.string :locality
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
