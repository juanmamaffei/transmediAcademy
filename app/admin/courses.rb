ActiveAdmin.register Course do
  active_admin_importable
  permit_params :name, :description, :category, :price, :goals, :duration, :evaluation, :visibility, :aasm_state
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :category, :price, :goals, :duration, :evaluation, :visibility, :chapters, :aasm_state
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :category, :price, :goals, :duration, :evaluation, :visibility, :chapters, :aasm_state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
