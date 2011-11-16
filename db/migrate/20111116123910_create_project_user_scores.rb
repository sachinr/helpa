class CreateProjectUserScores < ActiveRecord::Migration
  def change
    create_table :project_user_scores do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :score

      t.timestamps
    end
  end
end
