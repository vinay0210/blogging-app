class LikepsController < ApplicationController
	def likeToggle
		pos = params[:post]
		@post = Post.find(pos);
		@likep = Likep.where(post_id:pos,user_id:current_user.id).first
		likep = @likep
		if likep
			noti = Notification.where(notifiable: likep)
			if noti
				Notification.find_by_id(noti.ids).destroy
			end
			likep.destroy
		else
			likep = Likep.new
			likep.post_id = pos
			likep.user_id = current_user.id
			likep.save
		end
		respond_to do |format|
			if likep
       		Notification.create(recipient: likep.user,action: "has liked",actor: likep.post.user,notifiable: likep)
       		end
			format.js {}
			format.html{return redirect_to '/home/blog'}
		end
		
	end
end
