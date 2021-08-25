class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :payment_id
      t.float :price
      t.datetime :date_of_charge
      t.string :status
      t.timestamps
    end
  end
end
