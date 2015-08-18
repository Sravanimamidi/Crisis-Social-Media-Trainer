class AddTweetCategoryIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_category_id, :integer, index: true
  end
end
