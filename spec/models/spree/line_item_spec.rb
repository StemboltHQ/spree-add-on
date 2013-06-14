require 'spec_helper'

describe Spree::LineItem do

  it { should have_many(:line_item_add_ons).dependent(:destroy) }
  it { should have_many(:add_ons).through(:line_item_add_ons) }

  describe '#amount' do
    let(:line_item) { create :line_item, quantity: 1, price: BigDecimal.new('5.00') }

    subject { line_item.amount }

    context 'when the line item has add ons' do
      before do
        line_item.add_ons << create(:add_on, price: BigDecimal.new('5.00'))
      end
      it { should eq BigDecimal.new('10.00') }
    end
    context 'when the line item does not have any add ons' do
      it { should eq BigDecimal.new('5.00') }
    end
  end
end
