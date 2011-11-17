class RemoveProjectStartDate < ActiveRecord::Migration
  def up
    remove_column :projects, :start_date
    add_column :projects, :start_date, :date
  end

  def down
    remove_column :projects, :start_date
    add_column :projects, :start_date, :string
  end
end
