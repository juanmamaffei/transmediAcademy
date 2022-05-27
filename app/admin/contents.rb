ActiveAdmin.register Content do
  active_admin_importable
  permit_params :course, :chapter, :name, :richcontent, :priority, :testid, :minimumscore, :goals, :typeofcontent,
                :sequence, :embed, :requirements, :aasm_state
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :course_id, :chapter_id, :name, :richContent, :priority, :testId, :minimumScore, :goals, :typeOfContent, :sequence, :embed, :requirements, :aasm_state
  #
  # or
  #
  # permit_params do
  #   permitted = [:course_id, :chapter_id, :name, :richContent, :priority, :testId, :minimumScore, :goals, :typeOfContent, :sequence, :embed, :requirements, :aasm_state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
