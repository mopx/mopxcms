ActiveAdmin.register User do     
  menu :priority => 2, :parent => I18n.t("active_admin.users.title")

  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  show do |ad|
    rows = default_attribute_table_rows.reject {|a| a =~ /password|token/}
    attributes_table *rows
  end

  filter :email                       

  form do |f|                         
    f.inputs I18n.t("active_admin.users.user_details") do
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.buttons                         
  end                                 
end                                   
