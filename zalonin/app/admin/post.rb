ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :content,:user_id,:attachment

 form do |f|
    f.semantic_errors
    f.inputs do
      f.input :content
      f.input :user_id
      f.input :attachment, as: :file
     if f.object.attachment.present?
	     f.semantic_fields_for :attachment_attributes do |attachment_fields|
         attachment_fields.input :_destroy, as: :boolean, label: 'Delete?'
       end
     end
    end
    f.actions
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
