class Payment < ApplicationRecord
  belongs_to :payment_update, optional: true
  belongs_to :contract
  has_one :invoice

  after_create :generate_invoice

  def generate_invoice
    invoice = Invoice.create(payment_id: id, price: 1500)
  end
end
