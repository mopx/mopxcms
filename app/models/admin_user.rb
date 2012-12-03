class AdminUser < User
  self.table_name= :users
  default_scope where(["user_roles.role = ?", "admin"]).includes(:user_roles)

  # def role_symbols
  #   [:admin]
  # end
end


# class AdminUser < ActiveRecord::Base
#   # Include default devise modules. Others available are:
#   # :token_authenticatable, :confirmable,
#   # :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, 
#          :recoverable, :rememberable, :trackable, :validatable

#   # Setup accessible (or protected) attributes for your model
#   attr_accessible :email, :password, :password_confirmation, :remember_me
#   # attr_accessible :title, :body

#   def display_name
#     self.email || "#{self.class}: #{self.id}"
#   end

# end
