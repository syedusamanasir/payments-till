require 'rails_helper'
require 'active_support/testing/time_helpers'
FactoryBot.define do
  factory :customer do
    first_name { "John" }
    last_name  { "Doe" }
  end
end
FactoryBot.define do
  factory :contract do
    price { 1500 }
  end
end
describe 'Contract Alterations Over time' do # rubocop:disable RSpec/DescribeClass
  include ActiveSupport::Testing::TimeHelpers
  context "when contract doesnt change" do
    it 'creates correct invoices' do
    end
  end


  # factorybot
  let(:customer) { create(:customer) }
  let(:contract) { create(:contract, customer: customer) }

  context "when contract premiums goes down changes" do
    it 'checks a contract' do
      travel_to Date.new(2021,6,1) do
        contract
        expect(contract.invoices.count).to eq(1)
      end

      travel_to Date.new(2021,6,20) do
        # just an example, might be bad:
        contract.change_properties(deductible: 1000)
      end

      travel_to Date.new(2021,7,1) do
        InvoiceRunnerJob.perform_now
        expect(contract.invoices.count).to eq(2)
        expect(contract.invoices.all.sum(&:amount)).to eq(3000)
      end

    end
  end

end
