require "rails_helper"

RSpec.describe Report, :type => :model do
  subject { described_class.new(title: "Title", content: "Lorem ipsum", locality: "Rome",
                                user: User.new(username: "User", email: "user@mail.com"),
                                report_likes: [ReportLike.new(user: User.new(username: "User3", email: "user3@gmail.com"))],
                                report_comments: [ReportComment.new(user: User.new(username: "User2", email: "user2@gmail.com"),
                                                                    content: "Lorem ipsum")]
                                )
          }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a author" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a locality" do
    subject.locality = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:report_comments) }
    it { should have_many(:report_likes) }
  end

end