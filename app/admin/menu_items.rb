ActiveAdmin.register MenuItem do
  menu false

  form do |f|
    f.inputs do
      if !params[:menu_id].blank?
        f.input :menu, :selected => params[:menu_id]
      else
        f.input :menu#, :input_html => { :disabled => action_name == "edit" }
      end
      f.input :title
      f.input :page
      f.input :redirect
    end
    f.actions
  end

  controller do
    def index
      index! do |format|
        format.html { redirect_to admin_menus_path }
      end
    end
    def show
      show! do |format|
        format.html { redirect_to admin_menu_path(resource.menu) }
      end
    end
    def create
      create! do |format|
        format.html { redirect_to admin_menu_path(resource.menu) }
      end
    end
    def update
      update! do |format|
        format.html { redirect_to admin_menu_path(resource.menu) }
      end
    end
    def destroy
      destroy! do |format|
        format.html { redirect_to admin_menu_path(resource.menu) }
      end
    end
  end  

end
