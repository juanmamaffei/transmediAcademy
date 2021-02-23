ActiveAdmin.register Point do
  active_admin_importable
  permit_params :user, :content, :test, :score
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :content_id, :test_id, :score
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :content_id, :test_id, :score]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
