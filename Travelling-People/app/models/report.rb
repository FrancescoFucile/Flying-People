class Report < ApplicationRecord
  belongs_to :user
  
  has_many :report_comments, dependent: :destroy
  has_many :report_likes, dependent: :destroy

  validates :title, :presence => true
  validates :content, :presence => true
  validates :locality, :presence => true

  validates :user, :presence => true
  validates_associated :report_comments
  validates_associated :report_likes
end
