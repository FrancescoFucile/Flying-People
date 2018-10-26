require "rails_helper"

RSpec.describe ReportLike, :type => :model do
    describe "Associations" do
        it { should belong_to(:user) }
        it { should belong_to(:report) }
    end
end