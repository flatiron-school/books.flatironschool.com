class AddSlugToBooks < ActiveRecord::Migration
  def change
    add_column :books, :slug, :string, unique: true
    add_index :books, :slug
  end
end
