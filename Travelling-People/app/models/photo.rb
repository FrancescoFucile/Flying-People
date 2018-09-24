class Photo < ApplicationRecord
  belongs_to :user
  has_many :photo_likes, dependent: :destroy
  mount_uploader :image, ImageUploader
end
