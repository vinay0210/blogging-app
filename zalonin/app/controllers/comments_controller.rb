class CommentsController < InheritedResources::Base
before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
def edit
  end

  # comment /comments
  # comment /comments.json
  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        # (@comment.user.uniq-[current_user]).each do |f|
        Notification.create(recipient: @comment.user,action: "has commented on",actor: @comment.post.user,notifiable: @comment)
       
        format.html { redirect_to '/home/blog', notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js { }
    else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js{ }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to '/home/blog', notice: 'comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to '/home/blog', notice: 'comment was successfully destroyed.' }
      format.json { head :no_content }
      format.js{}
    end
  end

  
  private
  	 def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end

