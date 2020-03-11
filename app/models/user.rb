class User < ApplicationRecord
	has_many :tweets
	has_many :relationships, class_name: "Relationship",  foreign_key: "follower_id"
	has_many :relationships, class_name: "Relationship", foreign_key: "follower_id"
end
