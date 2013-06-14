require 'spec_helper'

describe Spree::Product do
  it { should have_many(:add_ons).dependent(:destroy) }
end
