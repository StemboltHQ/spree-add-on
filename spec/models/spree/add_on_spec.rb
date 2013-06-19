require 'spec_helper'

describe Spree::AddOn do
  let(:add_on) { build :add_on }

  it { should belong_to :product }
  it { should have_one(:default_price).dependent(:destroy) }
  it { should have_many(:prices).dependent(:destroy) }

  describe '#price_in' do
    let(:add_on) { create :add_on }
    subject { add_on.price_in('CAD') }
    context 'when a price with the currency exists' do
      let(:add_on_price) { add_on.create_default_price!(amount: 4.99, currency: 'CAD') }
      it { should eq add_on_price }
    end
    context 'when no matching price exists' do
      it { should be_a_new Spree::AddOnPrice }
      its(:currency) { should eq 'CAD' }
    end
  end

  describe '::default' do
    let(:default_add_on) { create :add_on, default: true }
    subject { Spree::AddOn.default }
    it { should match_array [default_add_on] }
  end

  describe '::types' do
    class Spree::AddOn::DummyAddOn < Spree::AddOn
    end

    before do
      Rails.application.config.spree.add_ons << Spree::AddOn::DummyAddOn
    end
    subject { Spree::AddOn.types }
    it { should match_array [Spree::AddOn::DummyAddOn] }
  end

  describe '::description' do
    subject { Spree::AddOn.description }
    it { should eq Spree::AddOn.human_attribute_name(:type_description) }
  end
end
