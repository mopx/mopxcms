class AdminUser < User
  self.table_name= :users
  # default_scope where(["user_roles.role = ?", "admin"]).includes(:user_roles)
end
