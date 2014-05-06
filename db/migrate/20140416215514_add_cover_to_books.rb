class AddCoverToBooks < ActiveRecord::Migration
  def change
    rename_column :books, :file, :cover 
  end
end
