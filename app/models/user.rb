class User < ApplicationRecord
	
   #Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Read dependent options
  has_many :tweets, dependent: :destroy
  has_many :active_relationships, class_name:"Relationship",  foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed


  def follow(user)
  	active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
  	active_relationships.find_by(followed_id: user.id).destroy
  end


 def following?(user)
 	following.include?(user)
end

end
