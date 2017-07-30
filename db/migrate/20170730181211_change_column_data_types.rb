class ChangeColumnDataTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :status
    add_column :orders, :status, :integer, default: 0
    change_column :users, :role, :integer, default: 0
  end
end
