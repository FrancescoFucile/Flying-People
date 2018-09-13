Given('I am logged-in') do
	visit root_path
	@user = User.create!(id: 50, username: 'prova', email: 'prova@example.com', password: 'provatest', password_confirmation: 'provatest')
	click_button("Accedi")
	fill_in("Email", :with => @user.email)
    fill_in("Password", :with => @user.password)
    click_button("Log in")
end

Given('"correctUser" is registered') do
	User.create!(id: 51, username: 'correctUser', email: 'correctUser@example.com', descrizione: 'correctUser description', password: 'provatest2', password_confirmation: 'provatest2')
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should be on my profile page$/ do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == root_path
  else
    assert_equal root_path, current_path
  end
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
