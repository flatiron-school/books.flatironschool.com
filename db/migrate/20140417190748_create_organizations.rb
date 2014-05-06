class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.name
      t.timestamps
    end
  end
end
