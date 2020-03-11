class Tweet < ApplicationRecord
	belongs_to :users
	validates :content, presence: true, length: { minimum: 5, maximum: 140 }
end
