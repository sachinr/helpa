class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :equipment
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
