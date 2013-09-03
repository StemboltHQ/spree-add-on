require 'spec_helper'

describe Spree::LineItemAddOn do
  it { should belong_to :add_on }
  it { should belong_to :line_item }

  describe '#expired?' do
    let(:add_on) { stub_model Spree::AddOn, expiration_days: expiration_date }
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
