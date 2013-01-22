FactoryGirl.define do
  factory :user do
    name     "Eric Nordmeyer"
    email    "eric@nordmeyer.name"
    password "foobar"
    password_confirmation "foobar"
    role "member"
  end

  factory :admin_user do
    name     "Admin Nordmeyer"
    email    "admin@nordmeyer.name"
    password "foobar"
    password_confirmation "foobar"
    role "admin"
  end
end
