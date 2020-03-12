class User < ApplicationRecord
	
   #Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Read dependent options
  has_many :tweets, dependent: :destroy
  has_many :relationships, class_name: "Relationship",  foreign_key: "follower_id"
  has_many :relationships, class_name: "Relationship", foreign_key: "followed_id"
end
