require 'spec_helper'

describe Menu do

  it "creates empty menu" do
    menu_name = "El Super Menu"
    menu = FactoryGirl.create(:menu, :display_name => menu_name)
    menu.name.should == menu_name.parameterize('_')
  end

end
