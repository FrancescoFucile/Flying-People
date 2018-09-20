require "rails_helper"

RSpec.describe MessageAbuse, :type => :model do
    it "Create a message abuse to another user" do
        user = User.create(username: "userTest", email: "user@example.com", password: "testtest", password_confirmation: "testtest")
        message_abuse = MessageAbuse.create(admin_id: user.id, body: "Cancella la foto di..")
        expect(message_abuse).not_to be_valid
    end

    it "Create a message abuse with no text" do
        admin = User.create(username: "AdminTest", email: "admin@example.com", password: "testtest", password_confirmation: "testtest", admin: true)
        message_abuse = MessageAbuse.create(admin_id: admin.id)
        expect(message_abuse).not_to be_valid
    end
end
