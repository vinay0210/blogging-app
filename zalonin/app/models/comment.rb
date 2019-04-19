class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :likecs, dependent: :destroy
  validates :content,presence: true
  def like_comment user_id
   Likec.where(comment_id: id, user_id: user_id).length > 0
  end
  def classStringComment user_id
    if like_comment user_id
      return "like"
    else
      return "unlike"
    end
  end


end
