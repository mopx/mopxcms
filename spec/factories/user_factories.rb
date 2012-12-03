FactoryGirl.define do

  factory :user do
    email                 { Faker::Internet.email }
    password              { Faker::Lorem.words(2).to_sentence }
    password_confirmation { |u| u.password }
    confirmed_at          { Time.now }
  end

end
