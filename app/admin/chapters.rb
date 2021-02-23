ActiveAdmin.register Chapter do
  active_admin_importable
  permit_params :sequence, :course, :name, :description, :goals, :aasm_state
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :goals, :course_id, :sequence, :aasm_state
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :goals, :course_id, :sequence, :aasm_state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
