class AddColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :incomplete, :boolean
  end
end
