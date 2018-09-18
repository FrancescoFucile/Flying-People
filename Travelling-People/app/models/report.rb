class Report < ApplicationRecord
  belongs_to :user

  has_many :report_comments, dependent: :destroy
  has_many :report_likes, dependent: :destroy
end
