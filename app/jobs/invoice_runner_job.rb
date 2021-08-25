class InvoiceRunnerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    contract = Contract.last
    contract.payments.create(price: 1500)
  end
end
