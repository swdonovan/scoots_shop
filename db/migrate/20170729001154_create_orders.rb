class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.timestamp :resolved_at
      t.timestamp :submitted_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
