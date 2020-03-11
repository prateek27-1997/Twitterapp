class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all
	end

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			flash[:notice] = "Tweet was successfully saved"
			redirect_to tweet_path(@tweet)
		else
			render 'new'
		end
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	def update
		@tweet = Tweet.find(params[:id])
		if @tweet.update(tweet_params)
			flash[:notice] = "Tweet was successfully updated"
			redirect_to tweet_path(@tweet)
		else
			render 'edit'
		end
	end

	private
	def tweet_params
		params.require(:tweet).permit(:content)
		end
end