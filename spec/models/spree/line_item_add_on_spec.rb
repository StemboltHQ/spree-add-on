require 'spec_helper'

describe Spree::LineItemAddOn do
  let(:add_on) { stub_model Spree::AddOn, expiration_days: expiration_date }

  it { should belong_to :add_on }
  it { should belong_to :line_item }

  it { should_not allow_value(nil).for(:add_on) }
  it { should_not allow_value(nil).for(:line_item) }

  describe 'after_create' do
    let(:line_item) { create :line_item }
    let(:add_on) { create :add_on, expiration_days: expiration_days, price: add_on_cost }
    let(:add_on_cost) { 1.23 }
    let(:expiration_days) { 7 }

    before do
      line_item.add_on_ids = [add_on.id]
      line_item.save!
    end

    subject { line_item.line_item_add_ons.first }

    its(:price) { should == add_on_cost }
    its(:money) { should == Spree::Money.new( add_on_cost, currency: line_item.order.currency ) }
    it 'has the correct expiry date' do
      expect ( subject.expiration_date.to_date ) == (Date.current + expiration_days.days)
    end
  end

  describe '#expired?' do
    let(:line_item_addon) { stub_model Spree::LineItemAddOn, add_on: add_on, created_at: created_at }

    subject { line_item_addon }

    context "without an expiration date" do
      let(:created_at) { 1.day.ago }
      let(:expiration_date) { nil }

      it { should_not be_expired }
    end

    context "with an expiration date" do
      let(:expiration_date) { 5 }

      context "a one day old line_item addon" do
        let(:created_at) { 1.day.ago }
        it { should_not be_expired }
      end

      context "a six day old line_item addon" do
        let(:created_at) { 6.days.ago }
        it { should be_expired }
      end
    end
  end
end
