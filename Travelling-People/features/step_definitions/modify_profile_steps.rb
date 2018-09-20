Given('I am a logged-in user') do
	visit root_path
	@user = User.create!(id: 50, username: 'prova', email: 'prova@example.com', password: 'provatest', password_confirmation: 'provatest')
	click_button("Accedi")
	fill_in("Email", :with => @user.email)
    fill_in("Password", :with => @user.password)
    click_button("Log in")
end

Then /^(?:|I )should be on my profile edit interface$/ do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == edit_user_registration_path(@user)
  else
    assert_equal edit_user_registration_path(@user), current_path
  end
end

When /^(?:|I )fill in "password" with my password$/ do
	fill_in("password", :with => @user.password)
end
