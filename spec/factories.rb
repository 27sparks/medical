FactoryGirl.define do
  factory :user do
    name     "Eric Nordmeyer"
    email    "eric@nordmeyer.name"
    password "foobar"
    password_confirmation "foobar"
  end
end
