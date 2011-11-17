class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :project_id
      t.integer :user_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
