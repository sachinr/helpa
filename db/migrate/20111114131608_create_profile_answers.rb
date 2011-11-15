class CreateProfileAnswers < ActiveRecord::Migration
  def change
    create_table :profile_answers do |t|
      t.integer :user_id
      t.integer :profile_question_id
      t.integer :score

      t.timestamps
    end
  end
end
