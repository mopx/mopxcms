FactoryGirl.define do

  factory :menu do
    display_name          { Faker::Lorem.sentence(2) }
    description           { Faker::Lorem.sentence(10) }
  end

  factory :menu_item_page, :class => MenuItem do
    title                 { Faker::Lorem.sentence(2) }
    page                  { @page }
    menu                  { @menu }
  end

  factory :menu_item_redirect, :class => MenuItem do
    title                 { Faker::Lorem.sentence(2) }
    redirect              { "http://google.com" }
    menu                  { @menu }
  end

end
