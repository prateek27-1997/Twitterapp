class TweetsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

    
    def index
	  @tweets = Tweet.all
	end

	def new
	  @tweet = current_user.tweets.build
	end

	def create
	  @tweet = current_user.tweets.build(tweet_params)
	    if @tweet.save
			# 'Tweet was successfully saved' and I18n
		  flash[:success] = 'Tweet was successfully saved'
		  redirect_to tweet_path(@tweet)
		else
		  render :new
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
	      flash[:success] = 'Tweet was successfully updated'
		  redirect_to tweet_path(@tweet)
		else
		  render :edit
		end
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
	end

	private

	def tweet_params
	  params.require(:tweet).permit(:content)
	end
end