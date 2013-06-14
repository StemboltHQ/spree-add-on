require 'spec_helper'

describe Spree::LineItemAddOn do
  it { should belong_to(:add_on).dependent(:destroy) }
  it { should belong_to(:line_item).dependent(:destroy) }
end
