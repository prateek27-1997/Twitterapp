class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :identify_user


  def create
    current_user.follow(@user)
    redirect_to tweets_path
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to tweets_path
  end

 private
  def identify_user
   @user = User.find_by(params[:id])
  end
end
