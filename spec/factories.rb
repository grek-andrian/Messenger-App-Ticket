FactoryGirl.define do
  factory :user do
    name     "User"
    email    "user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
