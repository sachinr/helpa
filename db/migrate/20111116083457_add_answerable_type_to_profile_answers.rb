class AddAnswerableTypeToProfileAnswers < ActiveRecord::Migration
  def change
    add_column :profile_answers, :answerable_type, :string
  end
end
