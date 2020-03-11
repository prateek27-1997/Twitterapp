class AddTweetidToTweet < ActiveRecord::Migration[5.2]
  def change
  	add_column :tweets, :Tweet_id, :integer
  end
end
