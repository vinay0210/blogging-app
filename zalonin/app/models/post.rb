
class Post < ActiveRecord::Base
  has_many :likeps, dependent: :destroy
  belongs_to :user
  has_attached_file :attachment, styles: { large: "1000x1000>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  has_many :comments, dependent: :destroy
  has_many :likeps, dependent: :destroy
  validates :content,presence: true
 

  def like_post user_id
  	Likep.where(post_id: id, user_id: user_id).length > 0
  end
  def classStringPost user_id
  	if like_post user_id
  		return "liked"
  	else
  		return "unliked"
  	end
  end

end
