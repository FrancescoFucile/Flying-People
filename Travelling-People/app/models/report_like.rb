class ReportLike < ApplicationRecord
  belongs_to :user
  belongs_to :report

  validates :user, :presence => true
  validates :report, :presence => true
end
