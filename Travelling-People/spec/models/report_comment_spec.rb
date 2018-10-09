require "rails_helper"

RSpec.describe ReportComment, :type => :model do

  subject { described_class.new(content: "comment",
                                user: User.new(username: "User", email: "user@mail.com"),
                                report: Report.new(title: "report",
                                                    user: User.new(username: "User2",
                                                                   email: "user2@gmail.com"),
                                                    locality: "some place",
                                                    content: "Lorem ipsum")
                                )
          }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a author" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a report" do
    subject.report = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:report) }
  end
end