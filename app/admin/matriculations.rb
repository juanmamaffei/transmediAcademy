ActiveAdmin.register Matriculation do
  active_admin_importable
  permit_params :user, :course, :permissions
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :course_id, :permissions
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :course_id, :permissions]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
