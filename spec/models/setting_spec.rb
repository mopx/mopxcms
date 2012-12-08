require 'spec_helper'

describe Setting do

	# system settings

  it "adds a system setting" do
    setting_key = "language"
    setting_value = "es"
    setting = Setting.set(setting_key, setting_value, nil, true)
    Setting.get(setting_key, nil, true).should == setting_value
  end

  it "updates system setting, no dups" do
    setting_key = "language"
    setting_value = "es"
    setting = Setting.set(setting_key, setting_value, nil, true)
    setting2 = Setting.set(setting_key, setting_value, nil, true)
    expect(Setting.count).to eq 1
  end

  it "unset system setting, deletes key" do
    setting_key = "language"
    setting_value = "es"
    setting = Setting.set(setting_key, setting_value, nil, true)
    expect(Setting.count).to eq 1
    Setting.unset(setting_key, nil, true)
    expect(Setting.count).to eq 0
  end

  it "unsets system setting by sending empty value" do
    setting_key = "language"
    setting_value = "es"
    setting = Setting.set(setting_key, setting_value, nil, true)
    expect(Setting.count).to eq 1
    Setting.set(setting_key, "", nil, true)
    expect(Setting.count).to eq 0
  end

  # user settings

  it "adds a user setting" do
  	user = FactoryGirl.create(:user)
    setting_key = "language"
    setting_value = "es"
    setting = Setting.set(setting_key, setting_value, user, true)
    Setting.get(setting_key, user, true).should == setting_value
  end

  it "updates user setting, no dups" do
  	user = FactoryGirl.create(:user)
    setting_key = "language"
    setting_value = "es"
    setting = Setting.set(setting_key, setting_value, user, true)
    setting2 = Setting.set(setting_key, setting_value, user, true)
    expect(Setting.count).to eq 1
  end

  it "unset user setting, deletes key" do
  	user = FactoryGirl.create(:user)
    setting_key = "language"
    setting_value = "es"
    setting = Setting.set(setting_key, setting_value, user, true)
    expect(Setting.count).to eq 1
    Setting.unset(setting_key, user, true)
    expect(Setting.count).to eq 0
  end

  it "unsets user setting by sending empty value" do
  	user = FactoryGirl.create(:user)
    setting_key = "language"
    setting_value = "es"
    setting = Setting.set(setting_key, setting_value, user, true)
    expect(Setting.count).to eq 1
    Setting.set(setting_key, "", user, true)
    expect(Setting.count).to eq 0
  end

end
