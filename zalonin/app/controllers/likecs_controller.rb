class LikecsController < ApplicationController
	def likeToggleComment
		com = params[:comment]
		@comment = Comment.find(com);
		@likec = Likec.where(comment_id:com,user_id:current_user.id).first
		likec = @likec
		if likec
			@relation = true;
			noti = Notification.where(notifiable: likec)
			if noti
				Notification.find_by_id(noti.ids).destroy
			end
			likec.destroy
		else
			@relation = false;
			likec = Likec.new
			likec.comment_id = com
			likec.user_id = current_user.id
			likec.save
		end

		respond_to do |format|
       		if likec
       			Notification.create(recipient: likec.user,action: "has liked",actor: likec.comment.user,notifiable: likec)
       		end
			format.js {}
			format.html{return redirect_to '/home/blog'}
		end
	end
end
