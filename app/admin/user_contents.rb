ActiveAdmin.register UserContent do
  active_admin_importable

  permit_params :markdown_content, :sticked, :user, :content, :content_type, :aasm_state
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :markdownContent, :sticked, :claps, :responseTo, :user_id, :content_id, :content_type, :aasm_state
  #
  # or
  #
  # permit_params do
  #   permitted = [:markdownContent, :sticked, :claps, :responseTo, :user_id, :content_id, :content_type, :aasm_state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
