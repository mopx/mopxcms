FactoryGirl.define do

  factory :page do
    title                 { Faker::Lorem.sentence(2) }
    body                  { Faker::Lorem.paragraph(5) }
    meta_keywords         { Faker::Lorem.sentence(10) }
    meta_description      { Faker::Lorem.sentence(20) }
  end

end
