class PaymentUpdate < ApplicationRecord
  has_one :payment
  belongs_to :contract
end
