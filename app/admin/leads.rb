ActiveAdmin.register Lead do
  active_admin_importable
  permit_params :status, :course, :name, :email, :info
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user, :status, :course, :name, :email, :info
  #
  # or
  #
  # permit_params do
  #   permitted = [:user, :status, :course, :name, :email, :info]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
