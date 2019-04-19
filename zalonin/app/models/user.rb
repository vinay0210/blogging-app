class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likeps, dependent: :destroy
  has_many :likecs, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_attached_file :profilepicture, styles: { profilepicture: "300x300>"}
  validates_attachment_content_type :profilepicture, content_type: /\Aimage\/.*\z/
  validates :firstname,presence: true
  validates :lastname,presence: true
  validates :username,presence: true,uniqueness: true
  has_many :notifications,class_name: "Notification",foreign_key: :recipient_id
  def followings
    User.find(Followmapping.where(follower_id: id).pluck(:followee_id))
  end
  def followers
    User.find(Followmapping.where(followee_id: id).pluck(:follower_id))
  end
  def followed followee_id,follower_id
    
    f = Followmapping.where(follower_id: follower_id,followee_id: followee_id).first
    if f
      return "unfollow"
    else
      return "follow"
    end
  end
  enum role: {member: 1, admin: 2, superadmin: 3}     

  
end
