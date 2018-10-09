#Given("I am a logged-in user") do
#    visit root_path
#    @user = User.create!(id: 50, username: 'prova', email: 'prova@example.com', password: 'provatest', password_confirmation: 'provatest')
#	click_button("Accedi")
#	fill_in("Email", :with => @user.email)
#    fill_in("Password", :with => @user.password)
#    click_button("Log in")
#end

When("I press (\".*\") ") do |label|
    click_on label
end

Then("I should be on an empty report editing interface") do
    expect(page).to have_content("Write a new report")
end

When(/^I fill in (\".*\") with (\".*\")$/) do |field, value|
    fill_in field.to_sym, :with => value
end

Then("I should be on the new report page") do
    current_path = URI.parse(current_url).path
    report_id = current_path.split("/").last
    current_path.should == report_path(Report.find(report_id))
end