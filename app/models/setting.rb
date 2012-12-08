class Setting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :key, :system, :value, :user_id
  serialize :value
  validates_presence_of :key, :value

  # set settings by key
  def self.set(key, value, user = nil, system = false)
    user_id = user.class == User ? user.id : nil
    Setting.update_or_create_by_key_and_system_and_user_id(key, system, user_id) do |s|
      if s.value != value
        if !value.blank?
          s.value = value
          s.save
          return s.value
        else
          s.destroy
          return nil
        end
      else
        return value
      end
    end
  end

  # TODO: cache this
  # get settings by key
  def self.get(key, user = nil, system = false)
    user_id = user.class == User ? user.id : nil
    setting = Setting.where(:key => key)
      .where(:system => system)
      .where(:user_id => user_id).first
    setting && setting.value ? setting.value : nil
  end

  # unset setting by deleting row
  def self.unset(key, user = nil, system = false)
    user_id = user.class == User ? user.id : nil
    setting = Setting.where(:key => key)
      .where(:system => system)
      .where(:user_id => user_id).first
    setting && setting.destroy
  end

end

# extending methods
# http://stackoverflow.com/a/5580108/246908
class ActiveRecord::Base
  def self.method_missing(method_id, *args, &block)
    method_name = method_id.to_s
    if method_name =~ /^update_or_create_by_(.+)$/
      update_or_create($1, *args, &block)
    else
      super
    end
  end
  def self.update_or_create(search, *args, &block)
    parameters = search.split("_and_")
    params = Hash[ parameters.zip(args) ]
    obj = where(params).first || self.new(params)
    yield obj
    obj.save
    obj
  end
end