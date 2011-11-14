class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :mission
      t.string :address1
      t.string :address2
      t.string :type

      t.timestamps
    end
  end
end
