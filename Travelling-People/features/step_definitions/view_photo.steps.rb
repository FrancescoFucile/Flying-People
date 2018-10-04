Given('I am a visitor') do
  visit root_path
  @user = User.create!(id: 50, username: 'prova', email: 'prova@example.com', password: 'provatest', password_confirmation: 'provatest')
  @photo = Photo.create(id: 50, user_id: 50, title: "test title", locality: "test locality", description: "test description", image: "test_image.jpg")
end


When /^(?:|I )go to a photo page$/ do
  visit "/photos/50"
end

Then /^(?:|I )should see informations of the photo$/ do
  expect(page).to have_content("test title")
  expect(page).to have_content("test locality")
  expect(page).to have_content("test description")
end
