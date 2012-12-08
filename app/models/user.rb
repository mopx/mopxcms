class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :settings
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def display_name
    self.email || "#{self.class}: #{self.id}"
  end

  # TODO: cache this
  def roles
    self.user_roles.map{ |r| r.role }
  end

  def role_symbols
    roles.map(&:to_sym)
  end

  def has_role?(role)
    self.roles.include?(role)
  end

end
