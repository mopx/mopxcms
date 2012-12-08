FactoryGirl.define do

  factory :setting do
    key						{ Faker::Lorem.characters(5) }
    value					{ Faker::Lorem.characters(30) }
  end

end
