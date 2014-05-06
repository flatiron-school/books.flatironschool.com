class ChangeColumnName < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :name, :nickname
    end
  end
end
