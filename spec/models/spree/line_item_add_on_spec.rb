require 'spec_helper'

describe Spree::LineItemAddOn do
  it { should belong_to :add_on }
  it { should belong_to :line_item }
end
