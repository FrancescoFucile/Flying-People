class ReportComment < ApplicationRecord
  belongs_to :user
  belongs_to :report

  validates :content, :presence => true
  validates :user, :presence => true
  validates :report, :presence => true
end
