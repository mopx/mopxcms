FactoryGirl.define do

  factory :menu do
    name                  { parameterize(Faker::Lorem.words(2), sep = '_') }
    display_name          { Faker::Lorem.words(2) }
    description           { Faker::Lorem.words(10) }
  end

  factory :menu_item_page, :class => MenuItem do
    title                 { Faker::Lorem.words(2) }
    page                  { @page }
    menu                  { @menu }
  end

  factory :menu_item_redirect, :class => MenuItem do
    title                 { Faker::Lorem.words(2) }
    redirect              { "http://google.com" }
    menu                  { @menu }
  end

end
