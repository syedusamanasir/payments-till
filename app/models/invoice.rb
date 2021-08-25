class Invoice < ApplicationRecord
  belongs_to :payment

  def amount
    price
  end
end
