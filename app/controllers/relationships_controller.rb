class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def new
    @relationship = Relationship.new
  end
	
  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
    	redirect_to tweets_path(@tweet)
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to @user
  end

  private

  def relationship_params
  	params.require(:relationship).permit(:follower_id, :followed_id)
  end
end
