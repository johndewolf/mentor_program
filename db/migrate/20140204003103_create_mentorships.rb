class CreateMentorships < ActiveRecord::Migration
  def change
    create_table :mentorships do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.boolean :giving_mentorship, null: false,  default: true
      t.string :status
      t.string :message
      t.datetime :accepted_at
      t.timestamps
    end
  end
end
