class RemoveUserIdFromProfileAnswer < ActiveRecord::Migration
  def up
    add_column :profile_answers, :answerable_id, :integer
    remove_column :profile_answers, :user_id
  end

  def down
    add_column :profile_answers, :user_id, :integer
    remove_column :profile_answers, :answerable_id
  end
end
