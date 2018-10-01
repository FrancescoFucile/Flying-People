class Report < ApplicationRecord
  belongs_to :user

  validates :title, :presence => true
  validates :content, :presence => true
  has_many :report_comments, dependent: :destroy
  has_many :report_likes, dependent: :destroy
end
