class CreatePaymentUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_updates do |t|
      t.float :price
      t.text :hash_map
      t.datetime :date_effective
      t.integer :contract_id
      t.timestamps
    end
  end
end
