class AddLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :region, :string
  end
end
