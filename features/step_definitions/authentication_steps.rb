Given /^a user visits the signin page$/ do
  visit new_user_session_path
end

When /^they submit invalid signin information$/ do
  click_button("Sign in")
end

Then /^they should see an error message$/ do
  expect(page).to have_content('Invalid Email or password.')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button("Sign in")
end

Then /^they should see home page$/ do
  expect(page).to have_content('Signed in successfully.')
end

Then /^they should see a signout link$/ do
  expect(page).to have_link('Logout', href: destroy_user_session_path)
end
