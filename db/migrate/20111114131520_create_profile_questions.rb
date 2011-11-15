class CreateProfileQuestions < ActiveRecord::Migration
  def change
    create_table :profile_questions do |t|
      t.string :long_display
      t.string :short_display

      t.timestamps
    end
  end
end
