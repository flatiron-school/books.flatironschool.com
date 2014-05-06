class AddColumnToTypes < ActiveRecord::Migration
  def change
    add_column :types, :incomplete, :boolean
  end
end
