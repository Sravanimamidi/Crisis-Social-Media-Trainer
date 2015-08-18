class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :time
      t.string :content
      t.string :fromUser

      t.timestamps
    end
  end
end
