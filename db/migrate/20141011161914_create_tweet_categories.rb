class CreateTweetCategories < ActiveRecord::Migration
  def change
    create_table :tweet_categories do |t|
      t.string :name
      t.string :description
    end
  end
end
