ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :firstname,:username,:lastname,:email,:profilepicture,:password,:role,:password_confirmation
 form do |f|
    f.semantic_errors
    f.inputs do
      f.input :firstname
      f.input :lastname
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
      f.input :profilepicture, as: :file
     if f.object.profilepicture.present?
	     f.semantic_fields_for :profilepicture_attributes do |profilepicture_fields|
         profilepicture_fields.input :_destroy, as: :boolean, label: 'Delete?'
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
