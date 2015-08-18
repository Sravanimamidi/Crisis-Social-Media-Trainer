class TweetsController < ApplicationController
 $global_var = 1
 #before_filter :set_counter
 $counter = 0
 def index
  $counter = 0
  @tweets = Tweet.order(:time => :desc)
  session[:ids] = @tweets
	respond_to do |format|
	 format.html 
		format.json { render json: @tweets }
end
end

def create
@tweet = Tweet.new
respond_to do |format|
	format.html 
	format.js
	end
 end
   
def show
@tweet = Tweet.find(params[:id])
render layout: false, json: @tweet
end

 def import
    #if !params[:upload].blank?    
	tweet_category = TweetCategory.find_by(name: params[:title])
	if tweet_category.nil?
		tweetcat = TweetCategory.new
		tweetcat.name = params[:title]
		tweetcat.description = params[:desc]
		tweetcat.save!
		tweet_category = TweetCategory.find_by(name: params[:title])
		#redirect_to root_url, :notice => "Messages Imported!"
	end
	begin
	Tweet.import(params[:file],tweet_category)
	redirect_to root_url, :notice => "Messages Imported!"
	rescue
    redirect_to tweets_upload_path, notice: "Invalid CSV file format."
	end
	#end
	#respond_to do |format|
	#format.html 
	#format.json
	#end
  end
 def setglobal
	var = params["edit"].keys
	
	$global_var = var
	redirect_to tweets_url
	
	#redirect_to root_url, notice: "Tweets imported."

 end
 def eachcat
	@catdata = Tweet.where(tweet_category_id: 2)
 end
 def category
	@data = TweetCategory.all
 end
 def upload
 end
 
 def set_counter
  puts "abcdefgh"
  @counter = 0 
   end
  
  def set_a
  puts params[:id]
  @twee = Tweet.where(tweet_category_id: $global_var)
  @oldesttweet = @twee.last
  render layout: false, json: @twee[$counter]
  $counter = $counter + 1
  end
  
end