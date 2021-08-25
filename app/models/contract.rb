class Contract < ApplicationRecord
  has_many :payment_updates
  has_many :payments
  has_many :invoices
  belongs_to :customer

  after_create :generate_payment

  def change_properties(*args)
    # Save Value in HashMap
    # Create payment update and write code to cater the changes later while creating the payment. 
  end

  def generate_payment
    payments.create(price: 1500)
  end

  def invoices
    Invoice.where(payment_id: payments.ids)
  end
end
