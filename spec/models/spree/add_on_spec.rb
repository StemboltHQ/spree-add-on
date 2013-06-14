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

  describe '::types' do
    before do
      Rails.application.config.spree.add_ons << Spree::AddOn::Dummy
    end
    subject { Spree::AddOn.types }
    it { should match_array [Spree::AddOn::Dummy] }
  end

  describe '::description' do
    subject { Spree::AddOn.description }
    it { should eq Spree::AddOn.human_attribute_name(:type_description) }
  end
end
