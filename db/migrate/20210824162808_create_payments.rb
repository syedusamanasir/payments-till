class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :schedule_type
      t.float :price
      t.integer :payment_update_id
      t.integer :contract_id
      t.timestamps
    end
  end
end
