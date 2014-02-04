class CreateMentorships < ActiveRecord::Migration
  def change
    create_table :mentorships do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.string :status
      t.datetime :accepted_at
      t.timestamps
    end
  end
end
