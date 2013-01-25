FactoryGirl.define do
  factory :user do
    name     "Eric Nordmeyer"
    email    "eric@nordmeyer.name"
    password "foobar"
    password_confirmation "foobar"
    role "member"
  end

  factory :pain do
    name     "My Pain Kind"
    bodypart    "head"
    description "alles"
  end
end
