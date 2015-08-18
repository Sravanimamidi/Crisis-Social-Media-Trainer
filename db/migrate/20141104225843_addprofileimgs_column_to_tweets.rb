class AddprofileimgsColumnToTweets < ActiveRecord::Migration
  def change
		 add_column :tweets, :profileimg, :string
  end
end
