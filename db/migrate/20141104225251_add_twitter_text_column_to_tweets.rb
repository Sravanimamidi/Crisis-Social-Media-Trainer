class AddTwitterTextColumnToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :twitter_text, :string
  end
end
