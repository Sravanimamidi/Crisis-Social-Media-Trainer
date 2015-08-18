class Tweet < ActiveRecord::Base
  has_one :tweet_category

  require 'CSV'
  
  
 
  def self.import(file, tweet_category)
  CSV.foreach(file.path, headers: true) do |row|
	 puts tweet_category[:id]
	# tweet_time, tweet_content, tweet_fromuser = row
	 puts row[0]
	 #binding.pry
	 tweet = Tweet.new
	 tweet.time = row[1]
	 tweet.content = row[0]
	 tweet.fromUser = row[2]
	 tweet.name= row[3]
	 tweet.profileimg= row[4]
	 tweet.tweet_category_id = tweet_category[:id]
	 tweet.save!
	 #tweet.create!(tweet_time,tweet_content,tweet_fromuser,tweet_category)
	 
  
     # tweet_hash = row.to_hash 
      #tweet = Tweet.where(id: tweet_hash["id"])
 
     #if tweet.count == 1
     #  tweet.first.update_attributes(tweet_hash)
     # else
     #  tweet.create!(tweet_hash)
     # end # end if !twwet.nil?
    end # end CSV.foreach
  end # end self.import(file)
end # end class


