class RemoveProjectStartDate < ActiveRecord::Migration
  def up
    remove_column :projects, :start_date
    remove_column :projects, :end_date
    add_column :projects, :start_date, :date
    add_column :projects, :end_date, :date
  end

  def down
    remove_column :projects, :start_date
    remove_column :projects, :end_date
    add_column :projects, :start_date, :string
    add_column :projects, :end_date, :string
  end
end
