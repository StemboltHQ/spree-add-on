require 'spec_helper'

describe Spree::AddOnPrice do
  let(:add_on_price) { Spree::AddOnPrice.new }
  subject { add_on_price }

  it { should belong_to :add_on }

  it { should_not allow_value(nil).for(:add_on) }

  it { should allow_value(nil).for(:amount) }
  it { should_not allow_value(-1).for(:amount) }

  context 'when currency is nil' do
    before do
      subject.add_on = mock_model Spree::AddOn
      subject.amount = 4.99
      subject.save
    end
    its(:currency) { should eq 'USD' }
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
