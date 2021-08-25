class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.float :price
      t.integer :customer_id
      t.timestamps
    end
  end
end
