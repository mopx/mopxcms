FactoryGirl.define do

  factory :page do
    title                 { Faker::Lorem.words(3) }
    body                  { Faker::Lorem.words(300) }
    meta_keywords         { Faker::Lorem.words(10) }
    meta_description      { Faker::Lorem.words(20) }
  end

end
