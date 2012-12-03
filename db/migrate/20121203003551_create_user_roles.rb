class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.references :user, :null => false
      t.string :role, :null => false
    end
    add_index :user_roles, :user_id
    add_index :user_roles, :role
  end
end
