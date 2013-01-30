FactoryGirl.define do
  factory :user do
    name     "Eric Nordmeyer"
    email    "eric@nordmeyer.name"
    password "foobar"
    password_confirmation "foobar"
    role "member"
    id "1"
  end

  factory :pain_entry do
    user_id "1"
    value "55"
    comment "kommentar"
    duration "Eine Stunde"
    pain_type "stechend"
    body_part "Kopf"
    side "rechts"
  end
end
