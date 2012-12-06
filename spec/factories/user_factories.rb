FactoryGirl.define do

  factory :user do
    email                 { Faker::Internet.email }
    password              { Faker::Lorem.characters(16) }
    password_confirmation { |u| u.password }
    confirmed_at          { Time.now }
  end

end
