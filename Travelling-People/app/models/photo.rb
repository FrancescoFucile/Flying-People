class Photo < ApplicationRecord
  belongs_to :user
  has_many :photo_likes, dependent: :destroy
  has_many :photo_comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
