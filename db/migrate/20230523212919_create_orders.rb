class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :ref_number
      t.string :order_status
      t.float :total_price
      t.string :payment_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
