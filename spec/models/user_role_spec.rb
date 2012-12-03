require 'spec_helper'

describe UserRole do

  it "adds admin role to user" do
    role = "admin"
    user = FactoryGirl.create(:user)
    user.user_roles.create!(:role => role)
    user.has_role?(role).should == true
  end

  it "allows multiple roles" do
    user = FactoryGirl.create(:user)
    role1 = user.user_roles.create!(:role => "admin")
    role2 = user.user_roles.create!(:role => "user")
    user.has_role?("admin").should == true
    user.has_role?("user").should == true
  end

  it "fails validation with no role" do
    user = FactoryGirl.create(:user)
    role = user.user_roles.create(:role => "")
    role.should have(1).error_on(:role)
  end

  it "fails validation with existing role" do
    user = FactoryGirl.create(:user)
    role1 = user.user_roles.create!(:role => "admin")
    role2 = user.user_roles.create(:role => "admin")
    role2.should have(1).error_on(:role)
  end

end
