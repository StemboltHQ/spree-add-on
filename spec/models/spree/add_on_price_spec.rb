require 'spec_helper'

describe Spree::AddOnPrice do
  let(:add_on_price) { Spree::AddOnPrice.new }
  subject { add_on_price }

  describe '#valid?' do
    context 'when add_on is nil' do
      it 'raises an error' do
        expect{ subject.valid? }.to raise_error 'Price must belong to an add-on'
      end
    end

    context 'when currency is nil' do
      before do
        subject.add_on = mock_model Spree::AddOn
        subject.valid?
      end
      its(:currency) { should eq 'USD' }
    end

    context 'when the amount is less than zero' do
      before do
        subject.add_on = mock_model Spree::AddOn
        subject.amount = -1
      end
      it { should_not be_valid }
    end
  end

  describe '#display_amount' do
    subject { add_on_price.display_amount }
    it { should eq Spree::Money.new(0, {currency: 'USD'}) }
  end

  describe '#money' do
    subject { add_on_price.money }
    it { should eq Spree::Money.new(0, {currency: 'USD'}) }
  end

  describe '#price=' do
    before do
      add_on_price.price = 4.99
    end
    its(:amount) { should eq 4.99 }
  end

end
