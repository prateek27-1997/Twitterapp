class User < ApplicationRecord
	
   #Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Read dependent options
  has_many :tweets, dependent: :destroy
end
