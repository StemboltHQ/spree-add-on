require 'spec_helper'

describe Spree::LineItem do

  it { should have_many(:line_item_add_ons).dependent(:destroy) }
  it { should have_many(:add_ons).through(:line_item_add_ons) }

  describe '#add_default_add_ons' do
    let(:variant) { create :variant }
    let(:product) { variant.product }

    let!(:add_on) { create :add_on, product: product, default: true }
    let(:line_item) { build :line_item, variant: variant }

    subject { line_item }
    before do
      line_item.save!
    end
    its(:add_ons) { should match_array [add_on] }
  end

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

  describe '#single_money_with_add_ons' do
    let(:line_item) { create :line_item }

    before do
      ids = 2.times.map { create(:add_on, price: 4.99).id }
      line_item.add_on_ids = ids
      line_item.save!
    end

    subject { line_item }
    its(:single_money_with_add_ons) { should == Spree::Money.new( line_item.price + (4.99 * 2), currency: 'USD' ) }
  end

  describe "#price_with_add_ons_unchanged?" do
    let(:line_item) { build :line_item }
    let(:money) { Spree::Money.new( 10, currency: 'CAD' ) }

    subject{ line_item }

    before do
      line_item.stub(single_money_with_add_ons: money)
      line_item.stub(single_money: money)
    end

    its(:price_with_add_ons_unchanged?) { should be_true }
  end
end
